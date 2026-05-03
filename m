Return-Path: <linux-gpio+bounces-35999-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iNvQOXJA92k2dwIAu9opvQ
	(envelope-from <linux-gpio+bounces-35999-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sun, 03 May 2026 14:32:50 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9873C4B5C96
	for <lists+linux-gpio@lfdr.de>; Sun, 03 May 2026 14:32:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 23D183012C5E
	for <lists+linux-gpio@lfdr.de>; Sun,  3 May 2026 12:30:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 168953B7B76;
	Sun,  3 May 2026 12:30:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="l+l5LZcQ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAD2E346AD4;
	Sun,  3 May 2026 12:30:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777811445; cv=none; b=EsRuyyyHpHPO8+MATM5kzeT0j5lAGmgAa07Ha5CY4gUTS2sPqiY+qT7ZnQPYie+LbyX6AJ0MFcL2Qh8GDB+UuD820aCKhum3LlWcHqCH32S2Q+BSjZp5GFMsUzoW+v9hergI2c87JgbtQ43uAW3DefQ7TmSfP57NjvsfwiTS4Ak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777811445; c=relaxed/simple;
	bh=dSx3A/Q6pWp2j6ybYlucc91dfW6YtHb+jyRqMqiDnxU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fGqCcy/F4L3iJ2Ic8WO8FVpk94e6c0RMfcaYjfW0wYvT5QTZCS7s3rvYMAzmS7LdJrWSPEq0DdSl8i5bfTIywnnCN7tqmDNl7oHYZkDphHv6993S0RIk8ucNjKd6PWZbBoSMuEIUEphpweezwlUS3uTDlwPhtRK+wEt797jxPn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=l+l5LZcQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DFF76C2BCB4;
	Sun,  3 May 2026 12:30:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777811445;
	bh=dSx3A/Q6pWp2j6ybYlucc91dfW6YtHb+jyRqMqiDnxU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=l+l5LZcQNuzbK17W6jMoHrU1EnuxV/fTbtcorJxdqOb+eO7hvKUpbqzrWZVXIrF/p
	 AfFM2Ds/0iEXVfqktgpDllZaNpE86CC3WR3MeOzq+OVpm6gW6UcRAhz/z7uEnnnoV6
	 eQFK2UroKLFBSbXwfBa0zEq5j4LvNOdDAdrI927ctRbZpYwrxrHtenOdDrbY9OW1uE
	 uucVcALS8gUjLfMgmLBLDR0jbCCwjx7td0ax+HuHD+v4orEFqB/NcN7o0i6c9LQvGQ
	 yB34RxdRIijysakLk0sjkRefCkEYXc1LTMFV0jOwfWiTXsBZo0SrKudWx8jaqdfXZQ
	 csLSJz+yW4q9Q==
Date: Sun, 3 May 2026 14:30:42 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>, 
	~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/5] dt-bindings: pinctrl: qcom: Add SM6350 LPI pinctrl
Message-ID: <20260503-bald-sensible-prawn-6dfe2d@quoll>
References: <20260430-sm6350-lpi-tlmm-v2-0-81d068025b97@fairphone.com>
 <20260430-sm6350-lpi-tlmm-v2-1-81d068025b97@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260430-sm6350-lpi-tlmm-v2-1-81d068025b97@fairphone.com>
X-Rspamd-Queue-Id: 9873C4B5C96
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35999-lists,linux-gpio=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,fairphone.com:email,qualcomm.com:email]

On Thu, Apr 30, 2026 at 09:10:41AM +0200, Luca Weiss wrote:
> Add bindings for pin controller in Low Power Audio SubSystem (LPASS).

... in Qualcomm SM6350 SoC Low Power Audio SubSystem (LPASS).

> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  .../pinctrl/qcom,sm6350-lpass-lpi-pinctrl.yaml     | 124 +++++++++++++++++++++
>  1 file changed, 124 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


