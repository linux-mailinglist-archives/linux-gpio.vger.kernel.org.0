Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D3CEC79D6A7
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Sep 2023 18:44:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236981AbjILQoE (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 12 Sep 2023 12:44:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37074 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234829AbjILQoD (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 12 Sep 2023 12:44:03 -0400
Received: from mx01.omp.ru (mx01.omp.ru [90.154.21.10])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 349DC115;
        Tue, 12 Sep 2023 09:43:58 -0700 (PDT)
Received: from [192.168.1.103] (31.173.80.111) by msexch01.omp.ru
 (10.188.4.12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.986.14; Tue, 12 Sep
 2023 19:43:52 +0300
Subject: Re: [PATCH 08/37] clk: renesas: rzg2l: trust value returned by
 hardware
To:     Claudiu <claudiu.beznea@tuxon.dev>, <geert+renesas@glider.be>,
        <mturquette@baylibre.com>, <sboyd@kernel.org>,
        <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
        <conor+dt@kernel.org>, <ulf.hansson@linaro.org>,
        <linus.walleij@linaro.org>, <gregkh@linuxfoundation.org>,
        <jirislaby@kernel.org>, <magnus.damm@gmail.com>,
        <catalin.marinas@arm.com>, <will@kernel.org>,
        <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        <biju.das.jz@bp.renesas.com>, <quic_bjorande@quicinc.com>,
        <arnd@arndb.de>, <konrad.dybcio@linaro.org>,
        <neil.armstrong@linaro.org>, <nfraprado@collabora.com>,
        <rafal@milecki.pl>, <wsa+renesas@sang-engineering.com>
CC:     <linux-renesas-soc@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-mmc@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
        <linux-serial@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
References: <20230912045157.177966-1-claudiu.beznea.uj@bp.renesas.com>
 <20230912045157.177966-9-claudiu.beznea.uj@bp.renesas.com>
From:   Sergey Shtylyov <s.shtylyov@omp.ru>
Organization: Open Mobile Platform
Message-ID: <8490f909-c0ad-5a6d-7a97-03c80a8b47ba@omp.ru>
Date:   Tue, 12 Sep 2023 19:43:52 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20230912045157.177966-9-claudiu.beznea.uj@bp.renesas.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [31.173.80.111]
X-ClientProxiedBy: msexch01.omp.ru (10.188.4.12) To msexch01.omp.ru
 (10.188.4.12)
X-KSE-ServerInfo: msexch01.omp.ru, 9
X-KSE-AntiSpam-Interceptor-Info: scan successful
X-KSE-AntiSpam-Version: 5.9.59, Database issued on: 09/12/2023 16:20:25
X-KSE-AntiSpam-Status: KAS_STATUS_NOT_DETECTED
X-KSE-AntiSpam-Method: none
X-KSE-AntiSpam-Rate: 59
X-KSE-AntiSpam-Info: Lua profiles 179815 [Sep 12 2023]
X-KSE-AntiSpam-Info: Version: 5.9.59.0
X-KSE-AntiSpam-Info: Envelope from: s.shtylyov@omp.ru
X-KSE-AntiSpam-Info: LuaCore: 530 530 ecb1547b3f72d1df4c71c0b60e67ba6b4aea5432
X-KSE-AntiSpam-Info: {rep_avail}
X-KSE-AntiSpam-Info: {Tracking_from_domain_doesnt_match_to}
X-KSE-AntiSpam-Info: {relay has no DNS name}
X-KSE-AntiSpam-Info: {SMTP from is not routable}
X-KSE-AntiSpam-Info: {Found in DNSBL: 31.173.80.111 in (user)
 b.barracudacentral.org}
X-KSE-AntiSpam-Info: {Found in DNSBL: 31.173.80.111 in (user)
 dbl.spamhaus.org}
X-KSE-AntiSpam-Info: 31.173.80.111:7.7.1,7.4.1,7.1.2,7.7.3;omp.ru:7.1.1;127.0.0.199:7.1.2;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1
X-KSE-AntiSpam-Info: {cloud_iprep_silent}
X-KSE-AntiSpam-Info: FromAlignment: s
X-KSE-AntiSpam-Info: {rdns complete}
X-KSE-AntiSpam-Info: {fromrtbl complete}
X-KSE-AntiSpam-Info: ApMailHostAddress: 31.173.80.111
X-KSE-AntiSpam-Info: Rate: 59
X-KSE-AntiSpam-Info: Status: not_detected
X-KSE-AntiSpam-Info: Method: none
X-KSE-AntiSpam-Info: Auth:dmarc=none header.from=omp.ru;spf=none
 smtp.mailfrom=omp.ru;dkim=none
X-KSE-Antiphishing-Info: Clean
X-KSE-Antiphishing-ScanningType: Heuristic
X-KSE-Antiphishing-Method: None
X-KSE-Antiphishing-Bases: 09/12/2023 16:26:00
X-KSE-Antivirus-Interceptor-Info: scan successful
X-KSE-Antivirus-Info: Clean, bases: 9/12/2023 3:17:00 PM
X-KSE-Attachment-Filter-Triggered-Rules: Clean
X-KSE-Attachment-Filter-Triggered-Filters: Clean
X-KSE-BulkMessagesFiltering-Scan-Result: InTheLimit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 9/12/23 7:51 AM, Claudiu wrote:

> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> 
> Initial value of CPG_PL2SDHI_DSEL bits 0..1 or 4..6 is 01b. Hardware user's
> manual (r01uh0914ej0130-rzg2l-rzg2lc.pdf) specifies that setting 0 is
> prohibited. The rzg2l_cpg_sd_clk_mux_get_parent() should just read
> CPG_PL2SDHI_DSEL, trust the value and return the proper clock parent index
> based on the read value. Do this.
> 
> Fixes: eaff33646f4cb ("clk: renesas: rzg2l: Add SDHI clk mux support")
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> ---
>  drivers/clk/renesas/rzg2l-cpg.c | 8 +-------
>  1 file changed, 1 insertion(+), 7 deletions(-)
> 
> diff --git a/drivers/clk/renesas/rzg2l-cpg.c b/drivers/clk/renesas/rzg2l-cpg.c
> index 1195d4b1f545..d0d086d6dc51 100644
> --- a/drivers/clk/renesas/rzg2l-cpg.c
> +++ b/drivers/clk/renesas/rzg2l-cpg.c
> @@ -239,14 +239,8 @@ static u8 rzg2l_cpg_sd_clk_mux_get_parent(struct clk_hw *hw)
>  
>  	val >>= GET_SHIFT(hwdata->conf);
>  	val &= GENMASK(GET_WIDTH(hwdata->conf) - 1, 0);
> -	if (val) {
> -		val--;
> -	} else {
> -		/* Prohibited clk source, change it to 533 MHz(reset value) */
> -		rzg2l_cpg_sd_clk_mux_set_parent(hw, 0);
> -	}
>  
> -	return val;
> +	return val ? --val : val;

	return val ? val - 1 : 0;

