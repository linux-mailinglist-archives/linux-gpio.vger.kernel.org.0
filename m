Return-Path: <linux-gpio+bounces-33782-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AMDGLRpku2lujQIAu9opvQ
	(envelope-from <linux-gpio+bounces-33782-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Mar 2026 03:48:58 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 527342C5234
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Mar 2026 03:48:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EE0A63188113
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Mar 2026 02:47:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 49A2E3876CE;
	Thu, 19 Mar 2026 02:47:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sc98aoPL"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F26B0331A5E;
	Thu, 19 Mar 2026 02:47:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773888425; cv=none; b=pTHLV0BGRTIQMdiezoWOzLMl4a3XLfMnDNWTtJrz//xZai4T/Sf0S3k9HGZrsps5Ep6XtW9AAq56jSFpaFA3x7CcbVrTQ6NX7mv1FUELh4xtNlVNEASlfb3kQ5vEInBt1vnoZZHcOtfck1bkYBWbd2Hh6VVOgtfzeowip/vtwvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773888425; c=relaxed/simple;
	bh=stuPA0E5EmApw42nxUnfLbMPXKMN/bw8izWDnqCow+s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=T1INA+j+o7V7rk6DVvO9LykBhf1P0CkHkMx+xqh1m9usV07x5z+Is/yf6NSt7toDYcFOz9+tE0azrlCSDpsJb7zG1X/Ud4Mf7vHmnb3hKVCR7phOjzPtWvDFZ3eRAAtSqBQVur05oiyZO6J8Rb+yvtUIXz8/Gh7E31OtbE5+1XE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sc98aoPL; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED8CCC2BCB0;
	Thu, 19 Mar 2026 02:46:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773888422;
	bh=stuPA0E5EmApw42nxUnfLbMPXKMN/bw8izWDnqCow+s=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=sc98aoPLz0ZUg8bPFhnN4bYCxwK4Bily9tsMhmoW+618PFuFUlf6jIHySfmICbnAC
	 mFwZb5p1bMi0J3YCfcWej70BQV4HhOe1N1XcIhXEFYTBO5K4lZM7HvidpwRbczAkKG
	 OPRJ/9LlcmKESHpUOBuV61Q5wbKCjhxjJFB9MN+CWmf9z/Ot2c1A+eBXQPiVfV7XL1
	 JogOYKsLTJ+xjZ6j9MKNmZoHATJ55XfqjauCJQQhuIZhTmvCtl35jfla5kEOL/Xmmj
	 Ob6gjZbWZ4E95cWlDGFe9FMcJ/WsphUmvj0llRLIdPPy9pPBWQiJNSAxDV9xM7d8C8
	 PvZ5TW8K/Vn5Q==
From: Bjorn Andersson <andersson@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Robert Marko <robimarko@gmail.com>,
	Guru Das Srinagesh <linux@gurudas.dev>,
	Linus Walleij <linusw@kernel.org>,
	Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: (subset) [PATCH v2 0/6] Add minimal boot support for Qualcomm IPQ5210
Date: Wed, 18 Mar 2026 21:46:44 -0500
Message-ID: <177388840384.11529.3706646310858140952.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260318-ipq5210_boot_to_shell-v2-0-a87e27c37070@oss.qualcomm.com>
References: <20260318-ipq5210_boot_to_shell-v2-0-a87e27c37070@oss.qualcomm.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33782-lists,linux-gpio=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[baylibre.com,kernel.org,pengutronix.de,gmail.com,gurudas.dev,oss.qualcomm.com];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.996];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	RCPT_COUNT_TWELVE(0.00)[17];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 527342C5234
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Wed, 18 Mar 2026 14:09:42 +0530, Kathiravan Thirumoorthy wrote:
> The IPQ5210 is Qualcomm's SoC for Routers, Gateways and Access Points. This
> series adds minimal board boot support for ipq5210-rdp504 board.
> 
> SoCs based on IPQ5210 is shipped under 2 different marketing names such as
> Qualcomm Dragonwing F8 and Qualcomm Dragonwing N8. The difference being is
> F8 parts has the Passive Optical Network(PON) interface which acts as the
> backhaul where as in N8 parts it is ethernet backhaul.
> 
> [...]

Applied, thanks!

[4/6] dt-bindings: firmware: qcom,scm: Document ipq5210 SCM
      commit: e3f45d32664edd2b25746e22add3a20c088edbec

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

