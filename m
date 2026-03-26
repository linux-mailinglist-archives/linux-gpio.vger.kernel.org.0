Return-Path: <linux-gpio+bounces-34184-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iIW8HOulxGmZ1wQAu9opvQ
	(envelope-from <linux-gpio+bounces-34184-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 26 Mar 2026 04:20:11 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E30932EB83
	for <lists+linux-gpio@lfdr.de>; Thu, 26 Mar 2026 04:20:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 9241F301BDC8
	for <lists+linux-gpio@lfdr.de>; Thu, 26 Mar 2026 03:20:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 650A839C651;
	Thu, 26 Mar 2026 03:19:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MkBhJ9L5"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED60C39B951;
	Thu, 26 Mar 2026 03:19:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774495183; cv=none; b=LHY9VXvVAn2FDK/YSTZyrKz78Ld71Tx2WmOiNK08i2pPu8aGqk4K40LlHRuke1uqJBRTMqNLLSjbWBCF1JEA5YgioZofBqH5xoSnLOA3RDSIguC4kW3DSUzlS0Kver4RC10+kVVX9b/N6wzhItp7q0m9cXf77dsL6MRAH5t/y34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774495183; c=relaxed/simple;
	bh=Ijg98CHDkOIv763+VoXcnhCvsEG7o5MH60DndiASnyI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=U1IcmWonDKsZaUxtpLl+OtumX8znhkHOis58RY0QmGhTumr+dQVWanXX7ib26EUzn06M6Z77fXwHRubEb51BkfABW2j1Cj4tnpxgjbBK1o4No30gb8pZRolHcWrWCTXJibMzXbPMPMzxt35Na7UO4YXlCDAx3F4+wVgIxZSG4/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MkBhJ9L5; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A4D2C4CEF7;
	Thu, 26 Mar 2026 03:19:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774495182;
	bh=Ijg98CHDkOIv763+VoXcnhCvsEG7o5MH60DndiASnyI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=MkBhJ9L5mAwRqSqdsrLZY/Q7saPtAvPggZ93d9AAo5Zd4MlQAyn4TID7JkyUR0mbp
	 /BTJdm279Fp6woHpVM0n7aY4sisaWvRyEOhx4XvEDZ8jKQHCi3TjlU6SupViRVbTEf
	 GA5pX9He/PjwKfutmxfrCQ1MkGVQ7oYD9eI6WSLpEngV5Oddgl8fmn48L726x4z3/W
	 CtN0xKX8nXSeVFHE9T6g3fYX2mu00JnN83QT9yQnXGYKRunKwFEKdDWbR68/ljXNXi
	 n7nkN/p/bdBmUghIv+rh4oz89cZRRmgxdcS3wYdHdc4ahfJ9nA3bQj3LzIY+YKOj+T
	 TCT9qoGQdHr8A==
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
Subject: Re: [PATCH v3 0/2] Add minimal boot support for Qualcomm IPQ5210
Date: Wed, 25 Mar 2026 22:19:23 -0500
Message-ID: <177449516611.60308.13586225721353856557.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260325-ipq5210_boot_to_shell-v3-0-9c7360d19d10@oss.qualcomm.com>
References: <20260325-ipq5210_boot_to_shell-v3-0-9c7360d19d10@oss.qualcomm.com>
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
	TAGGED_FROM(0.00)[bounces-34184-lists,linux-gpio=lfdr.de];
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
X-Rspamd-Queue-Id: 5E30932EB83
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Wed, 25 Mar 2026 14:49:08 +0530, Kathiravan Thirumoorthy wrote:
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

[1/2] dt-bindings: qcom: add ipq5210 boards
      commit: 1ddff6f5dfd297c3e4177d1a251b5c04e8c1c44d
[2/2] arm64: dts: qcom: add IPQ5210 SoC and rdp504 board support
      commit: 6668b9bb1f0107de045ee3380ae329737a34d054

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

