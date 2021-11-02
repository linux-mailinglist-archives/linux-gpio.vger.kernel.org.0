Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3A469443943
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Nov 2021 00:02:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231295AbhKBXE4 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 2 Nov 2021 19:04:56 -0400
Received: from smtpcmd13147.aruba.it ([62.149.156.147]:46264 "EHLO
        smtpcmd13147.aruba.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229685AbhKBXEz (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 2 Nov 2021 19:04:55 -0400
Received: from [192.168.153.129] ([146.241.216.221])
        by Aruba Outgoing Smtp  with ESMTPSA
        id i2nFm97pQueW5i2nFmhbKy; Wed, 03 Nov 2021 00:02:18 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
        t=1635894138; bh=oK87bVnkYiUtGJyUmet+/HBPLdMRnwtDKTiOXteInjQ=;
        h=Subject:To:From:Date:MIME-Version:Content-Type;
        b=af9Fqkc8rTCEDQmqZTV4tg2Z5+pgBaFydeNISwHypnv5wrE45WUznIIEL+wZl66dr
         EbJlWFSbo0O10xt9GIe0dwRykOC6iRW7i7rvCo2qGu6s+5lJ+TBgGBWiiNpGcPSYkE
         SpySBaN42zgsr1vNVyfdgSoISMZVnKo849oKDIuXLlG8wluh+hEGH3XmynmR3yKrY0
         vONSQIjWFF7puji50eRAlLwEUbhF9RB8cqe2Lmnz/wg6HBaj9qyWaRmGw7iAWG+r5h
         3BvZoR5jFBZGllmXn9EuigU3T29/o9FUwcqprpohqsXOzqGub60BubHe6vvLcHDcis
         /5h6X9cv+hhQw==
Subject: Re: [PATCH v2 11/13] mmc: sdhci-esdhc-imx: Add sdhc support for
 i.MXRT series
To:     Jesse Taube <mr.bossman075@gmail.com>, linux-imx@nxp.com
Cc:     mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
        shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, ulf.hansson@linaro.org, aisheng.dong@nxp.com,
        stefan@agner.ch, linus.walleij@linaro.org,
        gregkh@linuxfoundation.org, arnd@arndb.de, olof@lixom.net,
        soc@kernel.org, linux@armlinux.org.uk, abel.vesa@nxp.com,
        adrian.hunter@intel.com, jirislaby@kernel.org,
        nobuhiro1.iwamatsu@toshiba.co.jp, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-mmc@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-serial@vger.kernel.org
References: <20211102225701.98944-1-Mr.Bossman075@gmail.com>
 <20211102225701.98944-12-Mr.Bossman075@gmail.com>
From:   Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <d52ec837-a936-0312-0322-7e3a061984b9@benettiengineering.com>
Date:   Wed, 3 Nov 2021 00:02:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211102225701.98944-12-Mr.Bossman075@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfJgmuaRDniGb9KZ6FZ4QyMEMS2aKi6SERw8sh1OzYMKDB/NA1B7vRiCroRDe6acGggzP8wENsLq6qLxSryxtKRnW+3qt7gNN0A6cCJHR+G1OVwyHuOL6
 T7Fmxiu4O7KNABNkcUCCOdapFoTQqYCFd6TJGaa1wldydiSjIAixnffyCvnmkPPCzSFG5di0q7fErw7oEkfu3dIfHiI034n40eYLFbERrXtY98ZJgnLqpQ47
 xx3QkLPZE9U52WXzIAqu6ELAkcn7ZNhATR8qhm0SLXgVaBuXU+5a2cqVnWP+7bP3SU/8PATpfYqPfDq7KgIjxD2YUPxcrI9uGm4cPqlBv6IJyT5hRo20tYq5
 SppOmk+VZzrKwQeAtVyOxtCjzlSlV1O02Rxpv8PwGzfalc8eNXvvimN1bF4Vy2BSii2Awnxx5L1dx9fEjHbIqu7xMzXZY7VSgVfvB38By6m7EdI4lHhvuV2V
 Ut33bBdqg4++BbE9kZhiPxdlxsm19Fq7rj+ovMJtnUqC7Qmm7oQM6EkWtOVH1LHxW0G4TF06BecSyHHoQQLZ+29zDD38YbArjbV2clXUzHro0CwY9LA1uI7k
 FfuWJbF3tdRUIQoPydsFiVkKOZXg5jezsORQosD0bC4yTvaT7+amwE3CUGMftUwqiXGZUZVCKO3f4/pgehmJxJnJAMo2x2Kg6qijtRHpwGdE8O8dwhTcbB6s
 JoL5IHHwlYPsd4mZ3kMp9LtP5933w488c3w720kmzg7S0X4m8t/twprBv+oAUDHxF8qka9AhLvt255TDuS0n6rUzEkvxW35kWJjDWCxm+0FbyrmqFI8lyTLQ
 kiVWF8EWSwOYIQWHJzUbkl/hW2HFe8tO4dF9Ghm2wmcqvSV9ro/oOfm0DRBF51X//vrZvvKerkMwsfl+KXiLkSiPvW2/TZcbmIKtamzNaqJh86rnoQbb+y0+
 zI++y+iCxdprMgAxMhVL1LCEsiI7xi+VyTFlIVdo+RbCtDsgx2Bn3gMyjE5uUi8NXqLPi63NxoTdkMf6CNNmEMeMPIS4fHwIv0seearHmrD42u0IYm7qGAP1
 3QJruOF1Yh1Jt/6SCxTgdBZv20uMrWRNPtzzSNNIgu6bhpl0bSyzS+lwP5PYyevelWBh2VsleL8rq7EQkv9bVUk2Wi0bszQXG4U=
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Jesse,

On 11/2/21 11:56 PM, Jesse Taube wrote:
> From: Jesse Taube <mr.bossman075@gmail.com>
> 
> Add support for i.MXRT1050's sdhc.
> 
> Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
> Signed-off-by: Jesse Taube <Mr.Bossman075@gmail.com>---

Here the 3 dashes are missing(---)

Best regards
-- 
Giulio Benetti
Benetti Engineering sas

> V1->V2:
> * Nothing done
> ---
>   drivers/mmc/host/sdhci-esdhc-imx.c | 7 +++++++
>   1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/mmc/host/sdhci-esdhc-imx.c b/drivers/mmc/host/sdhci-esdhc-imx.c
> index afaf33707d46..c852a6df5611 100644
> --- a/drivers/mmc/host/sdhci-esdhc-imx.c
> +++ b/drivers/mmc/host/sdhci-esdhc-imx.c
> @@ -305,6 +305,12 @@ static struct esdhc_soc_data usdhc_imx7ulp_data = {
>   			| ESDHC_FLAG_PMQOS | ESDHC_FLAG_HS400
>   			| ESDHC_FLAG_STATE_LOST_IN_LPMODE,
>   };
> +static struct esdhc_soc_data usdhc_imxrt_data = {
> +	.flags = ESDHC_FLAG_USDHC | ESDHC_FLAG_MAN_TUNING
> +			| ESDHC_FLAG_HS200 | ESDHC_FLAG_ERR004536
> +			| ESDHC_FLAG_BROKEN_AUTO_CMD23,
> +};
> +
>   
>   static struct esdhc_soc_data usdhc_imx8qxp_data = {
>   	.flags = ESDHC_FLAG_USDHC | ESDHC_FLAG_STD_TUNING
> @@ -357,6 +363,7 @@ static const struct of_device_id imx_esdhc_dt_ids[] = {
>   	{ .compatible = "fsl,imx7ulp-usdhc", .data = &usdhc_imx7ulp_data, },
>   	{ .compatible = "fsl,imx8qxp-usdhc", .data = &usdhc_imx8qxp_data, },
>   	{ .compatible = "fsl,imx8mm-usdhc", .data = &usdhc_imx8mm_data, },
> +	{ .compatible = "fsl,imxrt-usdhc", .data = &usdhc_imxrt_data, },
>   	{ .compatible = "nxp,s32g2-usdhc", .data = &usdhc_s32g2_data, },
>   	{ /* sentinel */ }
>   };
> 

