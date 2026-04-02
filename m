Return-Path: <linux-gpio+bounces-34579-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sGgbCNgqzmnIlQYAu9opvQ
	(envelope-from <linux-gpio+bounces-34579-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 02 Apr 2026 10:37:44 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DBDB3861FC
	for <lists+linux-gpio@lfdr.de>; Thu, 02 Apr 2026 10:37:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 293EC3135212
	for <lists+linux-gpio@lfdr.de>; Thu,  2 Apr 2026 08:30:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C0923A1E9F;
	Thu,  2 Apr 2026 08:30:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="J+BDRZRI"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E16B23314C2;
	Thu,  2 Apr 2026 08:30:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775118606; cv=none; b=ht8LrJhIqB+BR0MOFhDBGB2sgkw1hRKTaHsMwBv/rMXfKH9lwBLEH5W/J3tbIaaiGKOM1gdnTswvMAkalV66XJ/xz0nd1W/Jx48DV5lxf6vQ/oRvK+x8wgodUGf7rEHVPByOT/kyYYYfyk68fKt/O2d/uMJ6DbJXczGGf9oVHSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775118606; c=relaxed/simple;
	bh=f3OMYe24BIzLwz52vkVkdJZN5UJgKuGaAdMroDPyOgY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JLEUrK7s+7H0RywsFv0utdj9SB0OGUHn4Fb4xu73wS5zE9mnlvoqRzCu2b4GyVbkS4ZIh6O05i6DkwbVCtMYANAkBt72hURuM9Zfphtf6/LCcqS2kJVcG7J1DGWRpgnjLnPGtdpreu80VwldfiI/fvvqJU77bTWlZYuW8lwDRkI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=J+BDRZRI; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA851C116C6;
	Thu,  2 Apr 2026 08:30:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775118605;
	bh=f3OMYe24BIzLwz52vkVkdJZN5UJgKuGaAdMroDPyOgY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=J+BDRZRIryzq9W+DJcm5mHrpA/WR3l89tjf0i8xi9ilHDQ2gJDbgEAJLCVmt51T8j
	 6ae+lBAlpR0p0jcxKcyoBgrdct8YlybobJJOAxVn+EN9BtBHsnR19/L5qlh84o1hEi
	 H7/lf2oykvKnoUr+DZRzRrH3GbDlQg2W3JoNGxxUhsYv5mO2lTZi5Zrueu7LwCD0bi
	 XmugWMIILuL8qJdiDp+BH/+xcSk4rmhCfFPRKDfJNEbgnuXql8Ho6UkjQJzo+CQitm
	 24vCOFKECMf+AFeic5oLdk94sIgojTLztryjON44urSgbYw928TTEqSSg30qCQGdin
	 ksJe88uNvtiLw==
Date: Thu, 2 Apr 2026 10:30:02 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
	Jessica Zhang <jesszhan0024@gmail.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Cong Yang <yangcong5@huaqin.corp-partner.google.com>, 
	Ondrej Jirman <megi@xff.cz>, Javier Martinez Canillas <javierm@redhat.com>, 
	Jagan Teki <jagan@edgeble.ai>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Linus Walleij <linusw@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH 01/19] dt-bindings: display/panel: himax,hx83102:
 describe Waveshare panel
Message-ID: <20260402-sticky-wooden-silkworm-5bdff4@quoll>
References: <20260401-waveshare-dsi-touch-v1-0-5e9119b5a014@oss.qualcomm.com>
 <20260401-waveshare-dsi-touch-v1-1-5e9119b5a014@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260401-waveshare-dsi-touch-v1-1-5e9119b5a014@oss.qualcomm.com>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34579-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[23];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[linaro.org,gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,huaqin.corp-partner.google.com,xff.cz,redhat.com,edgeble.ai,lists.freedesktop.org,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 7DBDB3861FC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Apr 01, 2026 at 10:26:20AM +0300, Dmitry Baryshkov wrote:
> Describe Waveshare 12.3-DSI-TOUCH-A panel which allegedly uses HX83102
> as a panel controller.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/display/panel/himax,hx83102.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/panel/himax,hx83102.yaml b/Documentation/devicetree/bindings/display/panel/himax,hx83102.yaml
> index 66404b425af3..7667428bf9a8 100644
> --- a/Documentation/devicetree/bindings/display/panel/himax,hx83102.yaml
> +++ b/Documentation/devicetree/bindings/display/panel/himax,hx83102.yaml
> @@ -30,6 +30,8 @@ properties:
>            - starry,2082109qfh040022-50e
>            # STARRY himax83102-j02 10.51" WUXGA TFT LCD panel
>            - starry,himax83102-j02
> +          # Waveshare 12.3-DSI-TOUCH-A panel
> +          - waveshare,12.3-dsi-touch-a

I don't think we use '.' in compatibles, so waveshare,12-3-dsi-touch-a

Best regards,
Krzysztof


