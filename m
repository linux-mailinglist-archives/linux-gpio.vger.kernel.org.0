Return-Path: <linux-gpio+bounces-36000-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uIeXFEhB92l7dwIAu9opvQ
	(envelope-from <linux-gpio+bounces-36000-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sun, 03 May 2026 14:36:24 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F1AC54B5CDD
	for <lists+linux-gpio@lfdr.de>; Sun, 03 May 2026 14:36:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9E92E3007CA2
	for <lists+linux-gpio@lfdr.de>; Sun,  3 May 2026 12:36:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DCFD63B7B8C;
	Sun,  3 May 2026 12:36:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dkS7ihVp"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DD7D40DFD0;
	Sun,  3 May 2026 12:36:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777811779; cv=none; b=HACrrs9m/UBJ/SiDBcKrZSTAAj1kN+KozcEn0um0NsCUvWZMuBnhmBMr4kQQoVvj0Lagq/ATLYTzhHkdfZd7S2mme5Q27GOnWuIjFl8z0BwBeGL3FBhG895n8LXJfj2zvBJoouVopXR5wmDkobbcJQVycI+z0kmNkCey2Nc9g3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777811779; c=relaxed/simple;
	bh=SzPbX4oT0GD9DJnLZPjxg1fv/uUYA5k6SSdT8BXe2mQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sXD/TeZ4vJfCo/RLWCg0+Idnbru/bIQuYozeCAUaeCyVK0kXcT6kmjDax5avhRxHdvwxexSSvAL5RYn9HRFUdJj3h0U0fUKFi53wU5GYXMVnzbzfmCOy/Xeoa23qOvLZEsVQABKKzF2L0ly6cqGcONQU/1g8NwGIHoqdEu+Oo9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dkS7ihVp; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9004C2BCB4;
	Sun,  3 May 2026 12:36:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777811779;
	bh=SzPbX4oT0GD9DJnLZPjxg1fv/uUYA5k6SSdT8BXe2mQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dkS7ihVpBHtjY+2l/uvmVxfPD6tNLVuqKRxgtZLjkpauuFDITWpCxpGkIdNstanFV
	 mY8rj3V5Qenk9vvYaqiUCheL35NYbHD6nEMA/yVJVDPNOqJfnAS6bqmNPCrb+H/aQP
	 E4dxGyEGpDnyhzTeBcSds/qghiaN/2dacgeUK5mUWpj5Nr5upzrlmAFpD8XoeUq33P
	 /ji7f/06Hz0UkMj5Wujqw/f/MJ1rT4AoU2Tqy/LTFD3JwfYL/YBnPCKpg8doU0QLMS
	 hjqbmALA1R8TAu1ehi9kFhPAvNeYkHunmaFSMclX/5tw9J+/DDy260MG9lHCpGqMCR
	 Fvro0VFWQO7qA==
Date: Sun, 3 May 2026 14:36:16 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Swati Agarwal <swati.agarwal@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] dt-bindings: pinctrl: qcom: move gpio-hog schema to
 tlmm-common
Message-ID: <20260503-shaggy-coral-iguana-cbf5fb@quoll>
References: <20260430140118.3684018-1-swati.agarwal@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260430140118.3684018-1-swati.agarwal@oss.qualcomm.com>
X-Rspamd-Queue-Id: F1AC54B5CDD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-36000-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email]

On Thu, Apr 30, 2026 at 07:31:18PM +0530, Swati Agarwal wrote:
> Qualcomm TLMM-based pin controllers share the same gpio-hog binding
> semantics across multiple SoCs. The gpio-hog pattern currently defined in
> qcom,sdm845-pinctrl.yaml is not specific to SDM845 and applies to all TLMM
> controllers.
> 
> Move the gpio-hog patternProperties definition to qcom,tlmm-common.yaml so
> that it can be reused by other Qualcomm TLMM pinctrl bindings and avoid
> duplication.
> 
> Signed-off-by: Swati Agarwal <swati.agarwal@oss.qualcomm.com>
> ---
> Changes in v2:
> Move the gpio-hog patternProperties definition to qcom,tlmm-common.yaml
> 
> Link to v1:
> https://lore.kernel.org/all/20260417152014.3000797-1-swati.agarwal@oss.qualcomm.com/

Does not look like v1. That's a DTS patch.

Best regards,
Krzysztof


