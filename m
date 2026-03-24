Return-Path: <linux-gpio+bounces-34069-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QAi/B2zvwWkgYAQAu9opvQ
	(envelope-from <linux-gpio+bounces-34069-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Mar 2026 02:57:00 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BB12B300C74
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Mar 2026 02:56:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id E32C83034B0A
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Mar 2026 01:56:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69F1E37EFF3;
	Tue, 24 Mar 2026 01:56:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gFFX/yuZ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2770037C103;
	Tue, 24 Mar 2026 01:56:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774317390; cv=none; b=j4MnXfpXrDrWpg/JLZrVL2O8KWNJLD9HfijsAnXPbWqMn99IaRXzm77lBJWvWr6PNWcRH9lONUWxpZcy+UP0AA+xgVICTFORlWXLHj6U3lugG2Ah0QMwot9jEJsiY9A67yjb5Zf3CDNDIFe3K6xV88DqBOgG6csKoFogQH7SN7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774317390; c=relaxed/simple;
	bh=R8tXmUCSEDWF3MTpZBsWDMeEzMSROw58eo0L8a5HwZk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BnGdbQNR3e7n7GEVZdiBOuwidzMNEK5jI5q2VFzMlis02oMR5Ykq2RJd5phou0dRMAKOf2g6WgWQzGXzpk4LEMdaUA4F7maBsaDkC1VxKV9fgZMsjGK8My9Vk+9x4DLcEpjCydhl703vrzPnfOYWqS4TFpIfjGcghnlGT2aahb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gFFX/yuZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF4B2C4AF09;
	Tue, 24 Mar 2026 01:56:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774317389;
	bh=R8tXmUCSEDWF3MTpZBsWDMeEzMSROw58eo0L8a5HwZk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=gFFX/yuZ4GGJa77JVSyNON/2Vpn74Pmpiseq8RZyDPQtPLTH81AESBbG+5mijKXll
	 KaZrA6EqNUf/BL60WbIdpAO1LIcvopKW8xn3VThBfw4w0aTu0Gh2CLzb1tHqZQl6p2
	 /4YLXxnB9YHOsi7RF3d6fAsK1DqNfYSX+a+vRlWa99Ri1o6Gwu1VQ2CxnyM/EPVehY
	 R7JAoZWs/BnjLCI3/H+o74kSrYrBcykqOVxWfykW3j9M7gCcERyVBz8Gg3o1zNefvo
	 LmSGiOLFfp1EpK3ijeHA7oPpcPUNrR5kApWouRiugr5WrTuPnthvBX5mum4yKvar+6
	 NjZA/QwT2bGuQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Linus Walleij <linusw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Luca Weiss <luca.weiss@fairphone.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht,
	phone-devel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH 0/4] Add support for Milos LPASS LPI pinctrl
Date: Mon, 23 Mar 2026 20:56:19 -0500
Message-ID: <177431737466.23057.7104535276234811171.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260306-milos-pinctrl-lpi-v1-0-086946dbb855@fairphone.com>
References: <20260306-milos-pinctrl-lpi-v1-0-086946dbb855@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34069-lists,linux-gpio=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: BB12B300C74
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Fri, 06 Mar 2026 15:22:14 +0100, Luca Weiss wrote:
> Add the bindings, driver, arm64 defconfig and dts bits to support the
> LPASS LPI pinctrl on the Qualcomm Milos SoC.
> 
> The devicetree changes require the addition of GPR in milos.dtsi (as
> specified in the b4 deps), the pinctrl changes have no dependency.
> 
> 
> [...]

Applied, thanks!

[4/4] arm64: dts: qcom: milos: Add LPASS LPI pinctrl node
      commit: e7554449e9a225ee77600eef6bf410561de0d568

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

