Return-Path: <linux-gpio+bounces-35856-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yFo4O7Uk82nIxQEAu9opvQ
	(envelope-from <linux-gpio+bounces-35856-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 30 Apr 2026 11:45:25 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 659D64A0166
	for <lists+linux-gpio@lfdr.de>; Thu, 30 Apr 2026 11:45:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4A2C130CBF10
	for <lists+linux-gpio@lfdr.de>; Thu, 30 Apr 2026 09:37:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54B113A6417;
	Thu, 30 Apr 2026 09:36:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="O5LnLR/D"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 175852F8BF0;
	Thu, 30 Apr 2026 09:36:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777541772; cv=none; b=tRbxiCpAGGxebtvf+iMz2m0Pr2345N0/e2R213y/pCylZZKYne6INhcB8HWhaMHaMpY5DuAsEsT9CqSw69cmvF55al96y4Kv+ThsLclhLQCQIxZpv+fnGTmJXPPNEX1I4DbcsKpE9e8gRLUBw5vs8Xfu6uIvDwlvIH1qODy48Ps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777541772; c=relaxed/simple;
	bh=avqWV9+1kYue92kdR7R+TTmIfJWs4YivWcb9b5/Goms=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nSn46Ao+brslijmPx0hnq54s1/Ap+o7UoWxbUgB1eeLo+XMjx27C32ZTbyBrnYuEHUMHq0+EZyO7yB+eBiH3R+DTHg6JCOuKQt2dLvjfcXd2cJd8ChJHk0+pUUiqYCCwiCQQUK/2U35NyYrEiGAveWBR2hzQPL0CmKR/4uoCKiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=O5LnLR/D; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92AEDC2BCB3;
	Thu, 30 Apr 2026 09:36:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777541772;
	bh=avqWV9+1kYue92kdR7R+TTmIfJWs4YivWcb9b5/Goms=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=O5LnLR/DjHcp4w5Rz4EheEwhng3GWyD3y/VkybZmgO3RWj6GKzURAKeFU2Mkk6kuX
	 vG85/xroD0ytUyitvTQjqbQRaxRzY9C0xJDoNB/qqchAkfzkejBHs1R3V1gXMGxerO
	 wo35HfUzlShzsXWqQmuVy6a1XJEhzYHUlD3VGXisAVy6z0P6AJ+NQCWCEeMwMjREBz
	 MgecbET5v2o0SYoLVUDsRd7G8ZD49lkQpez929JmHo0hay2xDhVoQOYDpkOe2zVhlU
	 85SysvrNH8e0j+KRpGeNXs8toVfBPd8s2Dx87f9TCAJXA3eJhjxhuiQPxqPn1PAz/v
	 eAeuAvaGV1Ysg==
Date: Thu, 30 Apr 2026 11:36:09 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Xianwei Zhao <xianwei.zhao@amlogic.com>
Cc: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	linux-amlogic@lists.infradead.org, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/2] dt-bindings: pinctl: amlogic,pinctrl-a4: Add
 compatible string for A9
Message-ID: <20260430-notorious-cat-of-wonder-a6dacf@quoll>
References: <20260428-a9-pinctrl-v1-0-cd611bb5f52d@amlogic.com>
 <20260428-a9-pinctrl-v1-1-cd611bb5f52d@amlogic.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260428-a9-pinctrl-v1-1-cd611bb5f52d@amlogic.com>
X-Rspamd-Queue-Id: 659D64A0166
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
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
	TAGGED_FROM(0.00)[bounces-35856-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,linaro.org,baylibre.com,googlemail.com,lists.infradead.org,vger.kernel.org];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,amlogic.com:email]

On Tue, Apr 28, 2026 at 08:22:48AM +0000, Xianwei Zhao wrote:
> Update dt-binding document for pinctrl of Amlogic A9.

And why it is not compatible with a4 or a5? You have entire commit msg
for this.

> 
> Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
> ---
>  Documentation/devicetree/bindings/pinctrl/amlogic,pinctrl-a4.yaml | 1 +
>  1 file changed, 1 insertion(+)

Best regards,
Krzysztof


