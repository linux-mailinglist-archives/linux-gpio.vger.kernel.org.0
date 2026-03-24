Return-Path: <linux-gpio+bounces-34068-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ALXdJljvwWkgYAQAu9opvQ
	(envelope-from <linux-gpio+bounces-34068-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Mar 2026 02:56:40 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F3E7300C57
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Mar 2026 02:56:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 34EFB30275DD
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Mar 2026 01:56:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2611037C913;
	Tue, 24 Mar 2026 01:56:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UwsxFAwc"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D508037BE65;
	Tue, 24 Mar 2026 01:56:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774317387; cv=none; b=DnRLfbgREhJ7QAm34xHWZUPafYmJq+kLvDY1Djh5LnxabAGNY6ziLX/yNegB+U5dXJ8qdZ95F0tSUU+/b4KvaytMmThlP8uCmPG2NV0Gxugom8/5Xu2qrnGmsmBtAznzPyh/JalY8tuZwMtEbPxNhd2PNWa4a1YhO2vDg+FUda4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774317387; c=relaxed/simple;
	bh=FTnmITopi0boG/8P8a4HNwrki9+LAZV3FYoD3p9hLtQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=aI2lHtcZMhtzOkO7SpvxysxW5pakU3LAMZQr9RGgqtSLHIOWaiT1F8AGmrR3lkIeRDNNGHle8Pdrz1DYgPAPDhvHGAY7pO8dv7PFTuaWTRS1HaDzNz05UiaM7gpaE6xA78pDpn6bhjI3JK1A6xS+pWRSmlFOJKAQesEdMlQzMkk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UwsxFAwc; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46256C2BCB3;
	Tue, 24 Mar 2026 01:56:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774317387;
	bh=FTnmITopi0boG/8P8a4HNwrki9+LAZV3FYoD3p9hLtQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=UwsxFAwcbY7rXQXM/qbiyyDC9sCS1sVNwP0Zrltcbmnb3rawKNw08Cj96g7eKlmO/
	 weVan7DRvaP2IjBg5xlkkH62NuE7SxHUzew4tU1rD5SnQELbwdrn7mJlQN4gyDtOQ1
	 Fl32QV5WyTf2JI1viuikRqiYni9GPu1YKqHCMwuoG3/r/Lz6s0z/m7+6Rpn8xg91y+
	 HR2CubvcYOyZgr7lbJj2lW22zbcnKCdvLsty9zByaVBnrMoeGAEFV8oKBOKKEq5pmK
	 Sx+Pm2LAa4LTbiyo+lZFkVNJOlirEqRt9UWT1dQbXQLvn9kKn9JS9n0pkoN0O/YY6e
	 25svsrRHIMRiA==
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
Date: Mon, 23 Mar 2026 20:56:17 -0500
Message-ID: <177431737468.23057.14929805535944334960.b4-ty@kernel.org>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34068-lists,linux-gpio=lfdr.de];
	FREEMAIL_TO(0.00)[baylibre.com,kernel.org,pengutronix.de,gmail.com,gurudas.dev,oss.qualcomm.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 3F3E7300C57
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

[6/6] arm64: defconfig: enable IPQ5210 RDP504 base configs
      commit: 2db93889e17e70ab516f13dbd33e1111b85a032a

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

