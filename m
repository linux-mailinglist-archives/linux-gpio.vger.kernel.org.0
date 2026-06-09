Return-Path: <linux-gpio+bounces-38148-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id MeZ6Jv+rJ2qg0QIAu9opvQ
	(envelope-from <linux-gpio+bounces-38148-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 09 Jun 2026 08:00:31 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 30DC965C8FD
	for <lists+linux-gpio@lfdr.de>; Tue, 09 Jun 2026 08:00:31 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=drjmgkvJ;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38148-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38148-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1E32A305D584
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Jun 2026 06:00:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C6AA63CCA15;
	Tue,  9 Jun 2026 06:00:24 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABCCE31E82A;
	Tue,  9 Jun 2026 06:00:23 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780984824; cv=none; b=Xi2XHWqjbQHfy3HtqwAYZ2O5xhH1sdQkOieLyA/mPqUUfywseDEBA/FrVE1yW9dFBLK1NpMSZywoKiyn6p0WKIYGfzcq8uv6zG35TGaZ2lVIDp41PnBea2ZEdtnHoFDFBMZyVUdSvy8LDOlxB4Qn8ru2ya8e8a+gKE1pRAKcThY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780984824; c=relaxed/simple;
	bh=Q/lK+sZt7GwPlBwwK69dLZf6j3mFRNG9lHSwsTuyARA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GzKoz5LDB5yyPAEqWRHvETtCqy3VGi19QMyLUflCXKm2vvVT16COsmdBXe8dEg65cM2mbjC4B/0dNn06A1MVuRjmuwdPAMo8A8SV8BEXRIp5ByvjwRV+UrodgZSL3XQCN+/WS6w7gVf293Bx9wAOMtMMN4A02teTTHLOMXJHiyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=drjmgkvJ; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B93301F00893;
	Tue,  9 Jun 2026 06:00:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780984823;
	bh=6YEx4I/Sr7vXQXTyMNROcZn4c8xb3Zj7/Z8myQZrk0M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=drjmgkvJM1vlu8xRrW9saDMhI097o+thAO1rGgg4CcKxIYNXkjoai4MOlL67qk0f9
	 ipMD7LKALWNGE3pnFM4Li6P0hW1G74wTbiEIu200rT1tGhc7O+aLWu5B3xIL9inqG+
	 pSiHYT0XfWc4Uv+fsybdjqw5adPkSoavFfeGW3+BZQq2oIl0e1/pNSRD+S4zdvOUQZ
	 GtNTIUuvabK76FdLO5RRZ8hiyJ1yvx6VhcjBbZpBuR5u7OGu2ns8clegh+1sncccvc
	 FsAY514AIekPUpsPIZDhSzDukdLHseCcHmixgB7JWXsJ4PYJ8WRh1Uz8CricT2PHTz
	 1RaRjL6MokItg==
Date: Mon, 8 Jun 2026 23:00:21 -0700
From: Drew Fustini <fustini@kernel.org>
To: Icenowy Zheng <zhengxingda@iscas.ac.cn>
Cc: Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Jisheng Zhang <jszhang@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-riscv@lists.infradead.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-phy@lists.infradead.org,
	linux-usb@vger.kernel.org, Icenowy Zheng <uwu@icenowy.me>,
	Han Gao <rabenda.cn@gmail.com>, Yao Zi <ziyao@disroot.org>
Subject: Re: [PATCH 02/12] clk: thead: th1520-ap: add support for MISC subsys
 clocks
Message-ID: <aier9XppLeCkJydw@thelio>
References: <20260507081710.4090814-1-zhengxingda@iscas.ac.cn>
 <20260507081710.4090814-3-zhengxingda@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260507081710.4090814-3-zhengxingda@iscas.ac.cn>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-38148-lists,linux-gpio=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:zhengxingda@iscas.ac.cn,m:guoren@kernel.org,m:wefu@redhat.com,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:vkoul@kernel.org,m:neil.armstrong@linaro.org,m:gregkh@linuxfoundation.org,m:pjw@kernel.org,m:palmer@dabbelt.com,m:aou@eecs.berkeley.edu,m:alex@ghiti.fr,m:jszhang@kernel.org,m:p.zabel@pengutronix.de,m:linux-riscv@lists.infradead.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:linux-phy@lists.infradead.org,m:linux-usb@vger.kernel.org,m:uwu@icenowy.me,m:rabenda.cn@gmail.com,m:ziyao@disroot.org,m:krzk@kernel.org,m:conor@kernel.org,m:rabendacn@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[27];
	FORGED_SENDER(0.00)[fustini@kernel.org,linux-gpio@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[fustini@kernel.org,linux-gpio@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,redhat.com,baylibre.com,linaro.org,linuxfoundation.org,dabbelt.com,eecs.berkeley.edu,ghiti.fr,pengutronix.de,lists.infradead.org,vger.kernel.org,icenowy.me,gmail.com,disroot.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[thelio:mid,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 30DC965C8FD

On Thu, May 07, 2026 at 04:17:00PM +0800, Icenowy Zheng wrote:
> The TH1520 SoC contains a MISC_SUBSYS clock controller, which allows
> controlling of USB related clocks and MMC/SD controller AHB bus clocks.
> 
> Add support for this clock controller, in order to enable USB support.
> 
> Signed-off-by: Icenowy Zheng <zhengxingda@iscas.ac.cn>
> ---
>  drivers/clk/thead/clk-th1520-ap.c | 64 +++++++++++++++++++++++++++++++
>  1 file changed, 64 insertions(+)
> 
> diff --git a/drivers/clk/thead/clk-th1520-ap.c b/drivers/clk/thead/clk-th1520-ap.c
> index 3a6847f1c950f..24f785f0b329a 100644
> --- a/drivers/clk/thead/clk-th1520-ap.c
> +++ b/drivers/clk/thead/clk-th1520-ap.c
[...]
> @@ -1609,6 +1663,12 @@ static int th1520_clk_probe(struct platform_device *pdev)
>  			return ret;
>  	}
>  
> +	if (plat_data == &th1520_ap_platdata) {
> +		ret = devm_clk_hw_register(dev, &usb_suspend_div_clk.hw);
> +		if (ret)
> +			return ret;
> +	}

Should usb_suspend_div_clk.hw instead be registered under
'if (plat_data == &th1520_ap_platdata)'?

Thanks,
Drew

