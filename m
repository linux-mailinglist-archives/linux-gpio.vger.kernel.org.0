Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 62AF6B1E2D
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Sep 2019 15:05:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387841AbfIMNFo (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 13 Sep 2019 09:05:44 -0400
Received: from mout2.freenet.de ([195.4.92.92]:59412 "EHLO mout2.freenet.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2387533AbfIMNFo (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 13 Sep 2019 09:05:44 -0400
X-Greylist: delayed 338 seconds by postgrey-1.27 at vger.kernel.org; Fri, 13 Sep 2019 09:05:43 EDT
Received: from [195.4.92.164] (helo=mjail1.freenet.de)
        by mout2.freenet.de with esmtpa (ID darrien@freenet.de) (port 25) (Exim 4.92 #3)
        id 1i8lBE-0004A4-Ru
        for linux-gpio@vger.kernel.org; Fri, 13 Sep 2019 15:00:04 +0200
Received: from [::1] (port=35100 helo=mjail1.freenet.de)
        by mjail1.freenet.de with esmtpa (ID darrien@freenet.de) (Exim 4.92 #3)
        id 1i8lBE-0000vs-RM
        for linux-gpio@vger.kernel.org; Fri, 13 Sep 2019 15:00:04 +0200
Received: from sub0.freenet.de ([195.4.92.119]:41472)
        by mjail1.freenet.de with esmtpa (ID darrien@freenet.de) (Exim 4.92 #3)
        id 1i8l9C-00088o-Fo
        for linux-gpio@vger.kernel.org; Fri, 13 Sep 2019 14:57:58 +0200
Received: from p57915997.dip0.t-ipconnect.de ([87.145.89.151]:36088 helo=[10.8.10.151])
        by sub0.freenet.de with esmtpsa (ID darrien@freenet.de) (TLSv1.2:ECDHE-RSA-CHACHA20-POLY1305:256) (port 587) (Exim 4.92 #3)
        id 1i8l9C-0004Vx-DI
        for linux-gpio@vger.kernel.org; Fri, 13 Sep 2019 14:57:58 +0200
To:     linux-gpio@vger.kernel.org
From:   Darrien <darrien@freenet.de>
Subject: [libgpiod] python binding decidedly unpythonic
Message-ID: <a2ad7284-b31c-a152-aebf-01efc4a36765@freenet.de>
Date:   Fri, 13 Sep 2019 14:57:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originated-At: 87.145.89.151!36088
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hello,

I just started working with python3-libgpiod and noticed that it is 
decidedly unpythonic.

For example the Line object functions active_state, consumer, direction, 
is_open_drain, is_open_source, is_requested, is_used, name, offset and 
owner should be properties, and set_value/get_value should be merged 
into one property.

Line.direction should probably also be writable for bidirectional pin use.

Regards

Darrien

