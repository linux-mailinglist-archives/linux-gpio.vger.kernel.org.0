Return-Path: <linux-gpio+bounces-33549-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kIIKATgguGmdZQEAu9opvQ
	(envelope-from <linux-gpio+bounces-33549-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Mar 2026 16:22:32 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 844A829C373
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Mar 2026 16:22:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4335F30A1716
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Mar 2026 15:17:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 74FD03A257F;
	Mon, 16 Mar 2026 15:16:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jtsz07GN"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA3B93A1D0A
	for <linux-gpio@vger.kernel.org>; Mon, 16 Mar 2026 15:16:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773674165; cv=pass; b=Ea3+JcfvjivSYChD2tWIa99Xk2ln+omjV9WawjDhEWtgk9LOSYaGeX2fYG2Et56id86MuQ7xWNNdrCafpr0r8x4YHgMMVLXFRMf4tAzw9VeFoVivuE6Rhs1sSF48rRKXapxNVSrPuPNBcvY2kSW3vDJVNrkPWbElACxEof53hzU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773674165; c=relaxed/simple;
	bh=SGrKOh6DxyjU+GV0XnOjtJnq9uPykPDANTIFfa61QH4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mFGhyFm/uAwgtxxvEP99K5D16RYucnieuFNxHPSKd1xuYzxQN8o4OD5KvGM4QQje609dVqIYs+15puN+0SunLG1Igm5Ig0F0Pi07/HiMZl58xSFuNWBqNugOxNo4K+q/IzbU8xHS+jwzHedAFVpYyOl9vsjZRDg04KDIaNXpZLA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jtsz07GN; arc=pass smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-38a694a3cf9so38591631fa.3
        for <linux-gpio@vger.kernel.org>; Mon, 16 Mar 2026 08:16:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773674162; cv=none;
        d=google.com; s=arc-20240605;
        b=MdJq84uywjBQyAXc7mM6s08Mmxe5LXmw2Cfoadfd6Wfv3nwiTQyaW5QP6idSM9tPen
         Lx8voYsxztvuC1FELIMoUho6siXbCyY+rABsfnJCfZo1UXnvSQqdmnrlZ7D+hVuZ+afa
         xA8PbPvc1dTTCcoW1CqLTib0oB1kKp6SDCGHiLpdUcxtk64h6RRZF6a5C0sS2zx6fJD5
         j0AN1ki7QTqbOgoJWAaX7ztzI7MHRqEyWVdyEi9OhLXz1kXUPalM99aHJvCLfruFu/gd
         B2tq9mbavsdpnkIVyhDSRnrq4gMknGds4zIoqKUbPi1zmbTXkK19XOLmUcd9MAck4Tu5
         68LQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=aWwOA9SQqzmxmd74/y4xRp+f9Kw/OsZUX40Voc8OPk4=;
        fh=gctNIQqgrhXmZGTpFZ2Y52js2gm2wXjXqe4jh5O/xIk=;
        b=Gf0lPnelCW+Z23VXMbbJIojLT7P9MXv/9EHxDyHK9V9g7s31VzvmM1RoCi9xN97EDG
         GaT26q1a43UVqSXY3il5MV/ZI9puKkFKi00eZR79B83FL/Fbho/tYV6N+vmhZxRxc1LK
         f8vNMspfhPxudXspAS8eT36kUroBbUUGkQhj84BHAQn8nrbOzDqN9o1yjBnppzmY8pj0
         oxzUEPvOpa/Ylx2Zg0v96JERRm2RAdZfDlBjo47j7t8j4CFkZ9XiI2bbCW43SnMyBBf+
         +9Zuz9cNWSAj2iVT6HgnAdp3ZKfYN+htJkCHjtDY4rUsg3GRmb/rJ0I2eIhaZzJxJSy7
         ysGw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773674162; x=1774278962; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=aWwOA9SQqzmxmd74/y4xRp+f9Kw/OsZUX40Voc8OPk4=;
        b=jtsz07GNFeAEXMC6uCu//Kl6N+FETjCtKU3pYIQGECDs/OEavmObeUfyyeV4xJYGAa
         JP3KQ/hR2fIxtUIi4vLy/zrESlImC2KgV8N2BWbuXtqq+lodc+6T3NnuRqHg/36XtRM8
         2jyu9oHE6oP6NpGRlGITsvzGunnEG6OnlOq+XQ97omXL/cGdtiRTfj4Xkypi8XBHzq4g
         hi+9JLBr+Fek8NouPQwdUQ8u72u5DpSMoK9DWQbPZASR7aZOntoPxVGjLJ92dI9D9ZDU
         2sTvLFOCqHr/zBXOFcAZpEH5e95dpF787Uv5voUdcW0ozL5K2Y8iC6mjSxDMc65Hf/5j
         RUfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773674162; x=1774278962;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aWwOA9SQqzmxmd74/y4xRp+f9Kw/OsZUX40Voc8OPk4=;
        b=XLExJd4OelFN+IkBab1XahgZvn7yVGP5sr/MAo7oLGw7JLaLwKIoTjuMsf7yxH3KCn
         6GpnRg+BRXfMo+WyEQadZKO3u0KmVDHilj53PtjkO8WTkFlQjIYIbd5SR4ylNTtXDnwZ
         Z4dgp/u/1o7WASIIozf8FzHvkLV7OtZ1zws1XCT7WRzEpsbrAFANFCs2jEjdrxmeOZEH
         xuBz4KYUXua275onVaGOhtw10k9WxIgrryopzKXT5GxezcgK0rOVG8C3DowGClfyeaq2
         DR4II8IbpEskVvNCZz/Ok4drrZSZna6e9xjAiJ/oE/fCn+1IOP7q9blUzFOcr7knZ9Sp
         Z5wA==
X-Forwarded-Encrypted: i=1; AJvYcCWB7TC0pMB4VluWRAQNjxkbnkHMC7yXKKz7IOtmOXxUl86JsCNojON1ZeAu7jMplRqQSHkjjpuar0Nv@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+GJdQAWtsQKDYwF3O6G440m+grzaz+MO2G4DeDsMuP4CUIX04
	tUnI6lWGRJSPVIK7O5Q26iYOg5KIOU7tgaGy/sYlpsi3KSJxsgq4O2m2Yzw6bSa/m2WeANregLS
	MQCRqz2VeE9VpVQ25iT2S+N2NvVw275RU2cEGH30jbA==
X-Gm-Gg: ATEYQzxDYBLxAovrxjCzkEnjSONNu4xadOmxL7fbHgLk4+gp8cvvBw6LrMafbLCZ9NP
	1f6+wx7TFGfmZCNEPEL8HMDkRPAkTP/rZfy5tPWL74XEl7p/ffPlnzwZZwHZxFId8teebPCVNAs
	IX/AhSSCda8BjZ9rjEdv6pyeTiYoPadRwWGxkuefnRj4TlDGrpX07sQbyHc5V8KEUojyblero4X
	COcfiLvGJySbsA7tihzXRJlznvu2b12D+2x1w1d36FzARCKCQUQCRdJO0MFU9VtuLW5XP+n6783
	G2nPZVCM
X-Received: by 2002:a05:651c:b1f:b0:386:7e61:5de1 with SMTP id
 38308e7fff4ca-38a8930e573mr42245921fa.0.1773674161832; Mon, 16 Mar 2026
 08:16:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260311-ipq5210_boot_to_shell-v1-0-fe857d68d698@oss.qualcomm.com>
 <20260311-ipq5210_boot_to_shell-v1-6-fe857d68d698@oss.qualcomm.com>
In-Reply-To: <20260311-ipq5210_boot_to_shell-v1-6-fe857d68d698@oss.qualcomm.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 16 Mar 2026 16:15:24 +0100
X-Gm-Features: AaiRm5153tShsk2TIyyE8TGCBjpaUzTwpROv6h6ltabxhtejv3_1C_1EaRy8Em0
Message-ID: <CAPDyKFq-pyTffu_D_eZAZQo3e=vkO3uhQ_hAjS-s2DY4TmXoXw@mail.gmail.com>
Subject: Re: [PATCH 6/9] dt-bindings: mmc: sdhci-msm: add IPQ5210 compatible
To: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Linus Walleij <linusw@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Robert Marko <robimarko@gmail.com>, 
	Guru Das Srinagesh <linux@gurudas.dev>, linux-arm-msm@vger.kernel.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-mmc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33549-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	FREEMAIL_CC(0.00)[kernel.org,baylibre.com,pengutronix.de,gmail.com,gurudas.dev,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ulf.hansson@linaro.org,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[linaro.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linaro.org:dkim,mail.gmail.com:mid,qualcomm.com:email]
X-Rspamd-Queue-Id: 844A829C373
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, 11 Mar 2026 at 10:46, Kathiravan Thirumoorthy
<kathiravan.thirumoorthy@oss.qualcomm.com> wrote:
>
> The IPQ5210 supports eMMC with an SDHCI controller. Add the appropriate
> compatible to the documentation.
>
> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/mmc/sdhci-msm.yaml | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/Documentation/devicetree/bindings/mmc/sdhci-msm.yaml b/Documentation/devicetree/bindings/mmc/sdhci-msm.yaml
> index 938be8228d668c87f0be95c63d4d951ebbadd4e4..fd1d5b04e7556903daffe86e455fde11be0dbd9f 100644
> --- a/Documentation/devicetree/bindings/mmc/sdhci-msm.yaml
> +++ b/Documentation/devicetree/bindings/mmc/sdhci-msm.yaml
> @@ -38,6 +38,7 @@ properties:
>        - items:
>            - enum:
>                - qcom,ipq5018-sdhci
> +              - qcom,ipq5210-sdhci
>                - qcom,ipq5332-sdhci
>                - qcom,ipq5424-sdhci
>                - qcom,ipq6018-sdhci
>
> --
> 2.34.1
>

Applied for next, thanks!

Kind regards
Uffe

