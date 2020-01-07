Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CC500132881
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Jan 2020 15:11:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727806AbgAGOLo (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 7 Jan 2020 09:11:44 -0500
Received: from out28-53.mail.aliyun.com ([115.124.28.53]:40631 "EHLO
        out28-53.mail.aliyun.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727658AbgAGOLn (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 7 Jan 2020 09:11:43 -0500
X-Alimail-AntiSpam: AC=CONTINUE;BC=0.2630506|-1;CH=green;DM=CONTINUE|CONTINUE|true|0.0462607-0.000847061-0.952892;DS=CONTINUE|ham_enroll_verification|0.0179212-0.000885296-0.981194;FP=0|0|0|0|0|-1|-1|-1;HT=e01a16378;MF=zhouyanjie@wanyeetech.com;NM=1;PH=DS;RN=5;RT=5;SR=0;TI=SMTPD_---.GXyTd0B_1578406289;
Received: from 192.168.1.7(mailfrom:zhouyanjie@wanyeetech.com fp:SMTPD_---.GXyTd0B_1578406289)
          by smtp.aliyun-inc.com(10.147.41.143);
          Tue, 07 Jan 2020 22:11:30 +0800
Subject: Re: [PATCH 0/5] pinctrl: ingenic: cleanups
To:     Paul Cercueil <paul@crapouillou.net>,
        Linus Walleij <linus.walleij@linaro.org>
References: <20200106232711.559727-1-paul@crapouillou.net>
Cc:     od@zcrc.me, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
From:   Zhou Yanjie <zhouyanjie@wanyeetech.com>
Message-ID: <5E149191.9020905@wanyeetech.com>
Date:   Tue, 7 Jan 2020 22:11:29 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
 Thunderbird/38.8.0
MIME-Version: 1.0
In-Reply-To: <20200106232711.559727-1-paul@crapouillou.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Linus,

On 2020年01月07日 07:27, Paul Cercueil wrote:
> Hi Linus,
>
> I saw you merged Zhou's patchset, here are some cleanup patches for
> pinctrl-ingenic that should be applied on top of his commits.

I agree with Paul, these cleanups look pretty good.

>
> Cheers,
> -Paul
>

