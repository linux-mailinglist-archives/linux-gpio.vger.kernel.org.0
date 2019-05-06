Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 747311542E
	for <lists+linux-gpio@lfdr.de>; Mon,  6 May 2019 21:10:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726145AbfEFTK1 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 6 May 2019 15:10:27 -0400
Received: from smtp07.smtpout.orange.fr ([80.12.242.129]:47229 "EHLO
        smtp.smtpout.orange.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726560AbfEFTK1 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 6 May 2019 15:10:27 -0400
Received: from belgarion ([90.76.40.160])
        by mwinf5d66 with ME
        id 97AQ200053TKnf6037AQpM; Mon, 06 May 2019 21:10:25 +0200
X-ME-Helo: belgarion
X-ME-Auth: amFyem1pay5yb2JlcnRAb3JhbmdlLmZy
X-ME-Date: Mon, 06 May 2019 21:10:25 +0200
X-ME-IP: 90.76.40.160
From:   Robert Jarzmik <robert.jarzmik@free.fr>
To:     Daniel Mack <daniel@zonque.org>
Cc:     haojian.zhuang@gmail.com, linus.walleij@linaro.org,
        linux-gpio@vger.kernel.org
Subject: Re: [PATCH v2 0/4] ARM: pxa3xx: introduce bias-pull{up,down} pinctrl
References: <20190424185858.7857-1-daniel@zonque.org>
X-URL:  http://belgarath.falguerolles.org/
Date:   Mon, 06 May 2019 21:10:24 +0200
In-Reply-To: <20190424185858.7857-1-daniel@zonque.org> (Daniel Mack's message
        of "Wed, 24 Apr 2019 20:58:54 +0200")
Message-ID: <87o94fl7q7.fsf@belgarion.home>
User-Agent: Gnus/5.130008 (Ma Gnus v0.8) Emacs/26 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Daniel Mack <daniel@zonque.org> writes:

> The first patch in this series adds bias-pull{up,down} pinctrl functions
> for PXA3xx. The next two make use of them in one of the Raumfeld DTS
> files, and the last one is a simple comment fixup.
>
> v2:
>
>  * rebase to v5.1-rc6
>  * amend patch subject and add 'raumfeld-controller' to 3/4
Queued to pxa/dt, thanks.

Cheers.

--
Robert
