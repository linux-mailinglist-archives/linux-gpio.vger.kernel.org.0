Return-Path: <linux-gpio+bounces-34072-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MEL+ICQAwmkjYwQAu9opvQ
	(envelope-from <linux-gpio+bounces-34072-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Mar 2026 04:08:20 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E020730188D
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Mar 2026 04:08:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F3BEF30E1539
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Mar 2026 03:06:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90327378D64;
	Tue, 24 Mar 2026 03:06:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ly7JD6/A"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DE243876C0;
	Tue, 24 Mar 2026 03:06:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774321569; cv=none; b=N0OaMvgg4AzF+JJ6zpiAnyLyJuj/f7Cl4h47QZG9OH4MHtJtBuGLuFFxlnj9mZ1/RdNLs5CdWHBdnSK2uFNnt5smR5XiR5wOr49FdjjF5JlXhRM8wlRjbIqbyvbOEentdEq/Ue1y21NbKmLa6tOmHCj4+WnqVJik53nGRu5T5s8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774321569; c=relaxed/simple;
	bh=FTnmITopi0boG/8P8a4HNwrki9+LAZV3FYoD3p9hLtQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Y44jsrSw4grKy8UEzbt4PdQ9ofy9bkVn1dhmWZWy44qKz5A1sKC6jgg+Rzy9PVYlhAVSchgSm+vWS1TV+isDiDR4zLmZmm8OXd2yMYYQG+8zM44wdTYqlPRZ2hqQI5+yK/9Ohp62qiHyfJO4PnT2+ud/NlaBvdwrVtAk/3dc2AA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ly7JD6/A; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13A0CC2BCB0;
	Tue, 24 Mar 2026 03:06:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774321568;
	bh=FTnmITopi0boG/8P8a4HNwrki9+LAZV3FYoD3p9hLtQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Ly7JD6/AjSfZGDRNmdO4npO7MAFixS9M1EczfDW36Qa/b6EqXhb/3d6rHfoDBeMvA
	 fGf9YUSG0mYlFuLTrgXI36/1c8z+BCHzJblCs0zzwnaBX/QXjpOHfT+qxk8NfIlyOP
	 UEQ3YC/rvTvkePgNaGMi0Z2GvNXn93Qa9bvbtw1PZVeh9WK72ZuRjkzcJ1Da4vNM6D
	 VaKzmWVfYVmcjdqrWto4JnVi7JOMcSLWVWUveDow5qfgMmVKzWIDcTkFEtTuL6O7T9
	 EIuvE2bU4CVUVX6NGmKs0EdTxG35OO7RCnOXwhcKxF1kuVaEr4nAiGVrriC5AdqzM+
	 +0KCBH8da6Kaw==
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
Date: Mon, 23 Mar 2026 22:05:52 -0500
Message-ID: <177432155640.28714.11710526578504129088.b4-ty@kernel.org>
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
	TAGGED_FROM(0.00)[bounces-34072-lists,linux-gpio=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: E020730188D
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

