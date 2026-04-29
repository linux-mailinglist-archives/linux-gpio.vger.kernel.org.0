Return-Path: <linux-gpio+bounces-35753-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GLJjIt2s8WmwjgEAu9opvQ
	(envelope-from <linux-gpio+bounces-35753-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Apr 2026 09:01:49 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CD94490223
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Apr 2026 09:01:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4CF88306BA84
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Apr 2026 06:59:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41F4F39DBE7;
	Wed, 29 Apr 2026 06:59:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Q/cg4vGU"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01715217F27;
	Wed, 29 Apr 2026 06:59:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777445964; cv=none; b=VMbyRt/DHYoDmW3HPvqasg/J9Jktnpauxb/lL4FR7M+fwh74pcKNoZSCxaq30nJntT8Vx0xuPTxxXClRkzwTooNEkW+HrkFCYrfeAtNaAhmkdqiRdDTmjBDle9i4h7Kcyr0L4qfoJhZaH3ZuKjjSZhuI9DftW7C6BW3p9Fohdnk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777445964; c=relaxed/simple;
	bh=Ty5rDqNCr57ubNVebLW5G9qiKvLhrBRgSdwjbxVB//Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fXlbtPPBe2GJ7g3asRI8578N8RUvmzsxQ9FgM9on+DIAueeiYrwkh+t6fEL/O08543L5/P3kdqdqJwR84NNhoKCSB5TitH9RR+LvZlICA7uiLfh1tZuZNsyN212Xak8s/0EuG4xo1mnk8DRcp55F2/l/MHmNtXZh1ZK5rOvopes=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Q/cg4vGU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D286C2BCC4;
	Wed, 29 Apr 2026 06:59:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777445963;
	bh=Ty5rDqNCr57ubNVebLW5G9qiKvLhrBRgSdwjbxVB//Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Q/cg4vGU7RW/4xZcVjUfFD/VIJjxpJ945fY3zz0vmzzs0f/oDvWLpkIG2wGQf+hQV
	 H/67Y9EXKsCuC4S9iUn/s6ijzLiq3T/4VsWLtJKX6yn2A37DG/zoy2C3il+zy7ICwR
	 IEuq8aUt+/11kqeNR7P2uNUuW4mdH8SplRlXP4K6gQExRo9UjL0lpbH5t1+tQGp6OQ
	 1J1W68d9K1amvAYorNC8WMeV3lCJt2Uw+H2q9jM2VKljcCIUpruRN1v7usa4ySZhvh
	 sOBagINgJlzk9fr2AMpGPR7VRuULasJmSN32ll8i3+Yu+fVLaSn4VBm23zOzpI9IW0
	 lnTEd/o9A+xQA==
Date: Wed, 29 Apr 2026 08:59:21 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Richard Cochran <richardcochran@gmail.com>, Bartosz Golaszewski <brgl@kernel.org>, 
	Shawn Guo <shengchao.guo@oss.qualcomm.com>, Arnd Bergmann <arnd@arndb.de>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, netdev@vger.kernel.org
Subject: Re: [PATCH v3 1/2] dt-bindings: pinctrl: describe the Qualcomm
 nord-tlmm
Message-ID: <20260429-smoky-expert-poodle-30482a@quoll>
References: <20260428-nord-tlmm-v3-0-f16f08d084cc@oss.qualcomm.com>
 <20260428-nord-tlmm-v3-1-f16f08d084cc@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260428-nord-tlmm-v3-1-f16f08d084cc@oss.qualcomm.com>
X-Rspamd-Queue-Id: 4CD94490223
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-35753-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,oss.qualcomm.com,arndb.de,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email]

On Tue, Apr 28, 2026 at 03:48:10PM +0200, Bartosz Golaszewski wrote:
> Add a DT binding document describing the TLMM pin controller available
> on the Nord platforms from Qualcomm.
> 
> Co-developed-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> ---
>  .../bindings/pinctrl/qcom,nord-tlmm.yaml           | 141 +++++++++++++++++++++
>  1 file changed, 141 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


