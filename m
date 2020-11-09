Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7B9E72AC26A
	for <lists+linux-gpio@lfdr.de>; Mon,  9 Nov 2020 18:34:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731243AbgKIReh (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 9 Nov 2020 12:34:37 -0500
Received: from smtp.radiodata.biz ([116.203.112.52]:51797 "EHLO
        smtp.radiodata.biz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729879AbgKIReg (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 9 Nov 2020 12:34:36 -0500
X-Greylist: delayed 517 seconds by postgrey-1.27 at vger.kernel.org; Mon, 09 Nov 2020 12:34:36 EST
Received: from localhost (localhost [127.0.0.1])
        by smtp.radiodata.biz (Postfix) with ESMTP id D168C3EFDA
        for <linux-gpio@vger.kernel.org>; Mon,  9 Nov 2020 18:25:56 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at smtp.radiodata.biz
Received: from smtp.radiodata.biz ([116.203.112.52])
        by localhost (smtp.radiodata.biz [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id 8BKSZH7T6jdg for <linux-gpio@vger.kernel.org>;
        Mon,  9 Nov 2020 18:25:48 +0100 (CET)
Received: from mail.radiodata.biz (p578044f8.dip0.t-ipconnect.de [87.128.68.248])
        by smtp.radiodata.biz (Postfix) with ESMTPSA id 452A13E925
        for <linux-gpio@vger.kernel.org>; Mon,  9 Nov 2020 18:25:48 +0100 (CET)
Received: from [192.168.2.180] (beteigeuze.radiodata.xx [192.168.2.180])
        by mail.radiodata.biz (Postfix) with ESMTPSA id E169120066
        for <linux-gpio@vger.kernel.org>; Mon,  9 Nov 2020 18:25:47 +0100 (CET)
To:     linux-gpio@vger.kernel.org
From:   Christian Schneider <cschneider@radiodata.biz>
Subject: [libgpiod] query state of output pin
Message-ID: <454bd58b-7498-0052-8442-8f20b6681a7d@radiodata.biz>
Date:   Mon, 9 Nov 2020 18:25:47 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi and sorry for asking user question here, but I couldn't find any 
other place to ask, and the documentation doesn't mention it.

Is it OK to query the state an output pin is set to with 
gpiod_line_get_value(), or does this give not what I want/expect?

BR, Christian
