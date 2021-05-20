Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 57886389B8F
	for <lists+linux-gpio@lfdr.de>; Thu, 20 May 2021 04:59:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229534AbhETDA4 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 19 May 2021 23:00:56 -0400
Received: from relay1-d.mail.gandi.net ([217.70.183.193]:56969 "EHLO
        relay1-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229505AbhETDA4 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 19 May 2021 23:00:56 -0400
Received: (Authenticated sender: frank@zago.net)
        by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 56ED3240003
        for <linux-gpio@vger.kernel.org>; Thu, 20 May 2021 02:59:34 +0000 (UTC)
To:     linux-gpio@vger.kernel.org
From:   Frank Zago <frank@zago.net>
Subject: [libgpiod] segfaults in gpiodetect and gpioinfo
Message-ID: <b2cb3a3c-8e20-f733-9898-f8ba21b52f7d@zago.net>
Date:   Wed, 19 May 2021 21:59:32 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hello,

If a user doesn't have permission, both gpiodetect and gpioinfo
will segfault when run.

$ ./gpiodetect 
gpiochip0 Permission denied
zsh: segmentation fault (core dumped)  ./gpiodetect

The problem is there:
			if (!chip) {
				if (errno == EACCES)
					printf("%s Permission denied\n",
					       entries[i]->d_name);
				else
					die_perror("unable to open %s",
						   entries[i]->d_name);
			}

chip is NULL, but is later dereferenced.

I'm not submitting a fix as there are 2 possibilities that I can see,
and I don't know which one would be best:

  - add a continue after the die_perror line
  - replace the printf above with die_perror()

Regards,
  Frank.
