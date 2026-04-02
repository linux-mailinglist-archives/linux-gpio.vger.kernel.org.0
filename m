Return-Path: <linux-gpio+bounces-34581-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OO17IsgqzmnIlQYAu9opvQ
	(envelope-from <linux-gpio+bounces-34581-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 02 Apr 2026 10:37:28 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 04F1A3861F4
	for <lists+linux-gpio@lfdr.de>; Thu, 02 Apr 2026 10:37:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5F762300D697
	for <lists+linux-gpio@lfdr.de>; Thu,  2 Apr 2026 08:33:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D9523A1E9F;
	Thu,  2 Apr 2026 08:33:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jG2HH9sW"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D2F83890FC;
	Thu,  2 Apr 2026 08:33:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775118790; cv=none; b=DNstgn0kLrIT8NSbi/LIIkNrHbbSNiFxJKK0ZplFI9ZtMet3WpKG2M1XMejRlC6OKYxLf2SkRK4yOHO2n9wgn/aPx8jItg3r7eVOu+l1iwuWfWT8NUUDsQzK9efa4XX+VeP8khMFfaoD7BpZUcNUAnrGoGbeVUGP5e6XS+NROYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775118790; c=relaxed/simple;
	bh=INDKtHgHQ0n50wacZnSNn0khdkNH2PNx0jlzaSDgQvM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RAkba0KrWxNGpPZrEsSQi5a/5FBhvnXsdfTE9BjhLk53K7s6rp7zjtO2ZEl0YO3QniY8MZw/LBP8d9cwoW2snZ/y2gZIl2KRA6kqpslw35d4YU7d61SzXYU9sINxLCqiKwq7v60j+uTsaNvU8+wGGBCy151R3/GeqVpkjkMGXYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jG2HH9sW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C090C116C6;
	Thu,  2 Apr 2026 08:33:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775118789;
	bh=INDKtHgHQ0n50wacZnSNn0khdkNH2PNx0jlzaSDgQvM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jG2HH9sWgGhhlsIVu7Z62OXVTDcrhA0kUh0hYkaB3f1ANXB+rx1hzqNYZTbp6usVK
	 lCDeGGOgrTNLmWk2jiqR8i6H8zs7+szNGVg/5BgNSJLMbqSBwR6HgXmc/mvIbaArLX
	 21RugLGvr79SGkknRZ1nC0m1AbOVhIAmkDMvKtmNZJtCVnmlZX5i0wAs6nyDU0x05J
	 QkYzLnS0ABsxHRbGeG1tNmwubIPFtIS9YHphyYh6WMhGR7KYbEZ02goOFIAbJZt+MS
	 N9UY5V2Y0iFUAfLzX7NO87/VzXltWztZavZ5IGcdgTZSl9cfkCsXQevY9/0EO3EqKv
	 xsHksarCY8p1g==
Date: Thu, 2 Apr 2026 10:33:07 +0200
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
Subject: Re: [PATCH 04/19] dt-bindings: display/panel: ilitek,ili9881c:
 describe Waveshare panel
Message-ID: <20260402-divergent-active-mantis-95bd18@quoll>
References: <20260401-waveshare-dsi-touch-v1-0-5e9119b5a014@oss.qualcomm.com>
 <20260401-waveshare-dsi-touch-v1-4-5e9119b5a014@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260401-waveshare-dsi-touch-v1-4-5e9119b5a014@oss.qualcomm.com>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34581-lists,linux-gpio=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email]
X-Rspamd-Queue-Id: 04F1A3861F4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Apr 01, 2026 at 10:26:23AM +0300, Dmitry Baryshkov wrote:
> Describe Waveshare 7" DSI panel which uses ILI9881 as a panel
> controller. This panel requires two voltags supplies, so add separate

typo, voltage supplies

> iovcc supply.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/display/panel/ilitek,ili9881c.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/panel/ilitek,ili9881c.yaml b/Documentation/devicetree/bindings/display/panel/ilitek,ili9881c.yaml
> index d979701a00a8..42e35986fbf6 100644
> --- a/Documentation/devicetree/bindings/display/panel/ilitek,ili9881c.yaml
> +++ b/Documentation/devicetree/bindings/display/panel/ilitek,ili9881c.yaml
> @@ -24,6 +24,7 @@ properties:
>            - raspberrypi,dsi-7inch
>            - startek,kd050hdfia020
>            - tdo,tl050hdv35
> +          - waveshare,7.0-dsi-touch-a
>            - wanchanglong,w552946aaa
>            - wanchanglong,w552946aba
>        - const: ilitek,ili9881c
> @@ -34,6 +35,7 @@ properties:
>    backlight: true
>    port: true
>    power-supply: true
> +  iovcc-supply: true
>    reset-gpios: true
>    rotation: true

Move the allOf to place before additional/unevaluatedProps and disallow
it for other variants.

Unless you assume that all other devices also could have iovcc, but then
please mention it in the commit msg.

Best regards,
Krzysztof


