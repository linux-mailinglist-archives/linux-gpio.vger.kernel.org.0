Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EFA4F3CEB5
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Jun 2019 16:30:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387767AbfFKO3y (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 11 Jun 2019 10:29:54 -0400
Received: from mout.kundenserver.de ([217.72.192.73]:38931 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387551AbfFKO3x (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 11 Jun 2019 10:29:53 -0400
Received: from [192.168.1.110] ([95.118.191.213]) by mrelayeu.kundenserver.de
 (mreue107 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1MX0TX-1h3RRu0fqz-00XK6T; Tue, 11 Jun 2019 16:29:51 +0200
Subject: Re: [PATCH] pinctrl: xway: Switch to SPDX header
To:     Lubomir Rintel <lkundrak@v3.sk>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     John Crispin <john@phrozen.org>,
        Martin Schiller <mschiller@tdt.de>, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20190611072001.2978298-1-lkundrak@v3.sk>
From:   "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Organization: metux IT consult
Message-ID: <8870c141-c7f2-7529-5452-3e246697496b@metux.net>
Date:   Tue, 11 Jun 2019 16:29:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux i686 on x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <20190611072001.2978298-1-lkundrak@v3.sk>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:fHL/tE8N4YuH7R23yxGsaf7pbX1UcbkqJHW1yuOymGJeRxopNEl
 +0Z876uzSpQ0J/FI8TJWienflt6tnrCqxZzirvM0ZIx0w6H+G3c+nCI4sHKeVuC8L/NmSld
 w4zIA7whXTAsWb6CcLACvjpIAep6wtpgxhqJ7xyjZd+nBnlvpGjg/KIEXgoN8lIW1bH1ikA
 1OHCnrjRrdCZ3z+ue038g==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:4UzKVJ+ntXY=:PPfSWDgvHJUo27CSJ+Dl+n
 u/NkRFQL2366sTeRpyTRZds7zCzSuSpx8dmMTVO/RyaaK3pV6v8IDJRdKsWBMq74gZ5lBtGOa
 zISQLgk4gVYWdZIqrxD9dgy2fSH/UJHmTH7uYC01KOfpdX9vDRqCQmAs4FdZPn0q13bOfSI5T
 KH1Ia21JSUjn9OieTDg4Xe5gJoDT/hn9hNvLRv+SPXJJJhNOpLplVeURNuvYOU/W1GM5/PLpf
 bNqOBjGLxFv8Dmv4EaoFDtoVHYFuxNjzpepaO1kQcBgoZftpPLrlR5ELbhODj+0eRsy1oQKCj
 b925Ynl3uDUiP8DgAu9NrniIb9GwhgtNCynvsOWeyoGZxp2mGYLiv+TKDDb/TfiM5sz/FTbxp
 HiaH++Ev2qtdJWdZafeze1yFHZlHCbQIOE+z5MaAACBHTh9SKKSgxFGcAtjLdFNI+p7iPnuqP
 +pYfq3qfMD+XXpD5Rlhb5LeZwUeFUPFib7UsXLAsqZrztwyM8ncgywi7nwpHwS1YoPC/PIWu1
 B8V6rEyyII52Mrkpj12WThwasIErNm+OazhqVUfi2TUYIwcXQ2tkHaYFpMzF/dNMpvQJNUtSv
 9FikaZn1Gom8YyVpdXO6KvuwPsEy6i4FDjSNxdtNNptqgL0uKsdz195A4qfzk06B+LeCFR4OT
 +zhcyMYND+eIgam+4mKWs6PN6ZIefC7ekB46tXHCDp+cPoL7YMHgK7/NcPSFaM/wu0U/PqXQB
 gjhOpvybiinCPUBqzFV4yXKbKtO6Fi7T9bcekOlZfgPokIz+xbIPw+FyQ+4=
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 11.06.19 09:20, Lubomir Rintel wrote:
> The original license text had a typo ("publishhed") which would be
> likely to confuse automated licensing auditing tools. Let's just switch
> to SPDX instead of fixing the wording.
> 
> Signed-off-by: Lubomir Rintel <lkundrak@v3.sk>

Reviewed-By: Enrico Weigelt <info@metux.net>

-- 
Enrico Weigelt, metux IT consult
Free software and Linux embedded engineering
info@metux.net -- +49-151-27565287
