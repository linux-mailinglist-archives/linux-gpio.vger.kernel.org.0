Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1D44DB2398
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Sep 2019 17:40:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388080AbfIMPkE (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 13 Sep 2019 11:40:04 -0400
Received: from mout2.freenet.de ([195.4.92.92]:59742 "EHLO mout2.freenet.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730354AbfIMPkE (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 13 Sep 2019 11:40:04 -0400
Received: from [195.4.92.164] (helo=mjail1.freenet.de)
        by mout2.freenet.de with esmtpa (ID darrien@freenet.de) (port 25) (Exim 4.92 #3)
        id 1i8ng2-0001Zo-KV
        for linux-gpio@vger.kernel.org; Fri, 13 Sep 2019 17:40:02 +0200
Received: from [::1] (port=37978 helo=mjail1.freenet.de)
        by mjail1.freenet.de with esmtpa (ID darrien@freenet.de) (Exim 4.92 #3)
        id 1i8ng2-0001Tm-Jv
        for linux-gpio@vger.kernel.org; Fri, 13 Sep 2019 17:40:02 +0200
Received: from sub2.freenet.de ([195.4.92.121]:40008)
        by mjail1.freenet.de with esmtpa (ID darrien@freenet.de) (Exim 4.92 #3)
        id 1i8ndv-0000k5-G2
        for linux-gpio@vger.kernel.org; Fri, 13 Sep 2019 17:37:51 +0200
Received: from p57915997.dip0.t-ipconnect.de ([87.145.89.151]:44518 helo=[10.8.10.151])
        by sub2.freenet.de with esmtpsa (ID darrien@freenet.de) (TLSv1.2:ECDHE-RSA-CHACHA20-POLY1305:256) (port 587) (Exim 4.92 #3)
        id 1i8ndv-00057F-DM
        for linux-gpio@vger.kernel.org; Fri, 13 Sep 2019 17:37:51 +0200
From:   Darrien <darrien@freenet.de>
Subject: [libgpiod] python binding decidedly unpythonic
To:     linux-gpio@vger.kernel.org
Message-ID: <7b3f67dd-ac14-e6b4-7b88-963bdd49a4a7@freenet.de>
Date:   Fri, 13 Sep 2019 17:37:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originated-At: 87.145.89.151!44518
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

