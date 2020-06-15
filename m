Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 68DDC1FA0B3
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Jun 2020 21:45:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728771AbgFOTpE (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 15 Jun 2020 15:45:04 -0400
Received: from mail.ionscale.com ([88.99.12.52]:51070 "EHLO mail.ionscale.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728773AbgFOTpE (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 15 Jun 2020 15:45:04 -0400
X-Greylist: delayed 311 seconds by postgrey-1.27 at vger.kernel.org; Mon, 15 Jun 2020 15:45:03 EDT
Received: from localhost (localhost.localdomain [127.0.0.1])
        by mail.ionscale.com (Postfix) with ESMTP id 3BF1A3455D1
        for <linux-gpio@vger.kernel.org>; Mon, 15 Jun 2020 21:39:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ionscale.com;
        s=201902; t=1592249991;
        bh=tBJ8Q9hjKZHNut9/okG9qnolDdUTFrqMgQr0J+UVW8A=;
        h=To:From:Subject:Date:From;
        b=lxPhIQOUC/ExX8yat4XeX9hLz7SRuZCOJ1fc7DfoOdr6Sx04kMEwSh40cxFzO1bNd
         UKXzRhXc+oh7I3zNs0eD44+UMbK3rUE63QAArRFY7f8R/aJKpYpj3qwNwp/yXMBIm3
         MNM2AxgmKE8WJofibB6CYHURvApBcb9dQ7kMznzZjxcl0tNpmi7x574CSSDeyGMsTP
         SqPPN37reIjdJ2tHZMEDwqmtfqmywaMs21aEerblZvNsalMJfyRLS54ht67HZoxUrc
         AlATdFjVzdTjlZbEgTxmRdYjxcGwZihnltQuq3Fi9YKh6MqEebqp5pn+akIL9yDye5
         CQj1wSd/rknkw==
X-Virus-Scanned: Debian amavisd-new at mail.esenta.de
Received: from mail.ionscale.com ([127.0.0.1])
        by localhost (mail.ionscale.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id CFj--uU2vsVe for <linux-gpio@vger.kernel.org>;
        Mon, 15 Jun 2020 21:39:47 +0200 (CEST)
Received: from [192.168.179.22] (xdsl-84-44-210-225.nc.de [84.44.210.225])
        by mail.ionscale.com (Postfix) with ESMTPSA id DFFFA343045
        for <linux-gpio@vger.kernel.org>; Mon, 15 Jun 2020 21:39:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ionscale.com;
        s=201902; t=1592249986;
        bh=tBJ8Q9hjKZHNut9/okG9qnolDdUTFrqMgQr0J+UVW8A=;
        h=To:From:Subject:Date:From;
        b=Jgttul5KIBG/1D7SJg3m/i2MRdJYZfBo9qK4zEQZfbFLin4iRTJyQzAE+z6uhVn3/
         g9KUCFOPVmlQ4c4HI6EA9mud9zSgGUsuko/oEsP5mCpU4WAtzaukVVRnR8zUU8mLe7
         hOiPyJ/Od/kPXpy9bVNlC4q5NRBrfe5CN0PF4r74dKAknQVgL2x9B0dzVkVBh9Ynvg
         3iEunvwPqz3p1NU0GZyfMYx5MrIBxIABFFA/7q7DJFrpGjXOwjlyzLWm2VZ8wC0pf3
         531qIKwIVv3v+06p6igiNSyexB56y+WO8jlg+jOK3uzfVAKWrE2ebFjOiEB9/bKWcQ
         bmL11QAtO2j9g==
To:     linux-gpio@vger.kernel.org
From:   Gerrit Wyen <ml@ionscale.com>
Subject: [libgpiod] reading multiple lines after edge event
Message-ID: <a21e051a-805b-4c26-6f47-99f1654f222b@ionscale.com>
Date:   Mon, 15 Jun 2020 21:39:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi,

can someone explain the following behavior and whether it is a bug?

When reading two lines at once via get_values() in response to an edge 
event I only receive the correct value for the first line (second line 
is high during the test but always reported as low).
See example code below:

lines.request({
  “gpiotest”, ::gpiod::line_request::EVENT_BOTH_EDGES,
  0,
});

auto events = lines.event_wait(::std::chrono::seconds(10));
if (events) {
  auto values = lines.get_values();
  for (auto& it: values) {
    ::std::cout << it;
    }
  }

However reading the same lines via get_value() one by one after the 
event works correctly. Like so:

for (auto& it: lines) { ::std::cout << it.get_value(); }


Also, when reading them without waiting for the event with 
line_request::DIRECTION_INPUT  the correct values are returned by 
get_values() as well as by get_value().

This behavior was tested on multiple different devices.


thanks,

Gerrit
