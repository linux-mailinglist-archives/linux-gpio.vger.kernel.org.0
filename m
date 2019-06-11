Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 440763CEA4
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Jun 2019 16:27:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389566AbfFKO1j (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 11 Jun 2019 10:27:39 -0400
Received: from mout.kundenserver.de ([217.72.192.73]:54807 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388676AbfFKO1i (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 11 Jun 2019 10:27:38 -0400
Received: from [192.168.1.110] ([95.118.191.213]) by mrelayeu.kundenserver.de
 (mreue109 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1N63NW-1gUNeI3ip6-016NZw; Tue, 11 Jun 2019 16:27:34 +0200
Subject: Re: [PATCH] pinctrl: lantiq: Switch to SPDX header
To:     Lubomir Rintel <lkundrak@v3.sk>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     John Crispin <john@phrozen.org>, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20190611072004.2978373-1-lkundrak@v3.sk>
From:   "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Organization: metux IT consult
Message-ID: <9c4a0f59-1e3a-0c72-b9e7-a7978753a52b@metux.net>
Date:   Tue, 11 Jun 2019 16:27:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux i686 on x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <20190611072004.2978373-1-lkundrak@v3.sk>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:PussVQk4+Tim9l3yHxtaW/xw3MAu2tJSQHgBiXBjwyJn3td4qd5
 DzAmcgkXFaVD5bU0mAirWCzHLXaqkq2nPJSDKP0Caf/anqMydAtp209jXXgXlbA4wqpTrk7
 qiASHhasELWfF9ZPOi0PPAlCgkxwuULwLUONBm4+CNeiV2/wD39EJq7g93H9u7X7gK16NOV
 uX8LfEAFqGpnUKrxEFt+Q==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:gNwBp84gseg=:6NaPQe9wBqiSo3CYlIqCTa
 Mxv22qGmczPYNPO/hSeVlxSDRXIdPXhHnCeBjh3T3gO9PsU5AWp68fH8FDHNtH44ukkyAq8/l
 ZchOcpV8eIFE3nHmaLyBoF2kEYPSGhGEA79FG/prDr4nAJ6MdkNqFS55njmekO9x1PNpF3vBT
 cD/ab686Ul/+UJLt0FtblFYACWSadLdamMcdEZA28RGxaOvlYfAfyNkjd5/ViFNh5ZwTWJuhy
 0O3UC/4wOKxOjS7rbK34lyjs/d6LQ09PdSRaD7B5R4pFX5ky0I5NY8cmOkDSzyrIYiUU+QMws
 whD5BMmlwzNhws3nqvly3+sO9w8V1Ai1cUhaNebsfrai98BJ6evUjaXQmOaxNFeGNLoZ4koli
 B5PNYCHR2KfOgZtoWhCd1Qqon8eb+rnjsZcf+Buytn1tSKFkTWYZkveAPWz1/rfSe4jYk1XC+
 qDLF2cWgh4Ksjjx8s07jbmguq3bMm2S8BeFAuUGOhRSg2yFY6IrpHusEZ4LMourHUgA7dSXrs
 fpQl+QI6T7GokdCTpHzYl/o/bUjiu/I2zYPXsLmWVK3ARGrVFmYdbcNdNwFS2OgVbWMa7Vn2Q
 k2wEq99B4WvON/qjA4dP/hopb2PKeBP9EVUCOIV37P6akLSHJDMewPzkdv/d2f2Vn/fMNb+Kp
 A4PBlU6XCcbD3hauSZYHRHvpsEINOWaASm+dNvjjoE6w1aH/8KNwZwTxPPJI9UqOn8w5iASPU
 FOMbT2f5650NJWq/mtNCvudq4xeLEpUMZ1JSKHmiFMM+bchkgd3pmI/0j2DznXsyKzQXWxh8c
 Ma+I5of
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 11.06.19 09:20, Lubomir Rintel wrote:
> The original license text had a typo ("publishhed") which would be
> likely to confuse automated licensing auditing tools. Let's just switch
> to SPDX instead of fixing the wording.

Reviewed-By: Enrico Weigelt <info@metux.net>

BTW: are you aware that there's a separate project for cleaning up
those things ?

maillist: linux-spdx@vger.kernel.org


--mtx

-- 
Enrico Weigelt, metux IT consult
Free software and Linux embedded engineering
info@metux.net -- +49-151-27565287
