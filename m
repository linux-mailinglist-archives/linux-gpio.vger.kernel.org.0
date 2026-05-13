Return-Path: <linux-gpio+bounces-36789-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QJrDJSvNBGrMPAIAu9opvQ
	(envelope-from <linux-gpio+bounces-36789-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 13 May 2026 21:12:43 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 78135539AFA
	for <lists+linux-gpio@lfdr.de>; Wed, 13 May 2026 21:12:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 90D353028601
	for <lists+linux-gpio@lfdr.de>; Wed, 13 May 2026 19:10:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5A413B8407;
	Wed, 13 May 2026 19:09:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EFg901xG"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A57FE3B83E3;
	Wed, 13 May 2026 19:09:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778699383; cv=none; b=qh9lj2LDJavIx/KijxcZZJU2me4h7eBAK99aN/uS9z5vZchmFABrPA540lWclWMMj4n7+xzNZMG38Rx566fxazHXanuYeEht4zfj0qmzOsCsPldL5OOH14MI+rckCXwBB01grPzrJc7NeAVzwjIIL3hhAZx0lgYtRkxsLA0SxmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778699383; c=relaxed/simple;
	bh=3DRuXLO/vyTluuUCVKw2ymdDOt5XQVOglfZYZ92JnBY=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sFrNnf7FvG5y4jbbUwElmTkcJSzp9pIcr1R6kWihz+GR/2w9RwZgk1bSfZEAqT63tyqm2GCojubCRQhqcHyIOHzgwdL3Wg+AVeu/946kgeZqCEpovhYqA34x7veoZaPKKTnT8uSPcwVlusKGpdVVJdD27bkVuHd5Ei/bWlZeaCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EFg901xG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5CDA6C2BCB7;
	Wed, 13 May 2026 19:09:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778699383;
	bh=3DRuXLO/vyTluuUCVKw2ymdDOt5XQVOglfZYZ92JnBY=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=EFg901xG0VaYftg7nXx2corijT7wrLLdQjVFMBwfhqTzup8tgWRKfyI+Ck1CrQIkh
	 VYHub00FBpFUapPM4oMVGdyxoOUp90Bvj55wEBn2KMspbQJAtkq+l4o9YyzlrkarWa
	 z+1FdT9skGvnGm859LZi7f8jXqrckBjs/Z0HydrvZ14hp5z3eea2wCnyflS+XaPZA9
	 hll7FNYADUJ02/dx/L6To9CeOREN9X1N+77iY3OSCN2HKM0bSVbvnW64NyHDKxDTTd
	 lyA8z7UKL4Xk+CeegslPOF58FhHmxQjhF5tp6dB6HT2knNs4oXo+4bultgkZTPLEQs
	 ragDuSjSqcmOA==
From: Bjorn Andersson <andersson@kernel.org>
To: Linus Walleij <linusw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Srinivas Kandagatla <srini@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	Richard Acayan <mailingradian@gmail.com>
Subject: Re: (subset) [PATCH v5 0/4] SDM670 LPASS LPI pin controller support
Date: Wed, 13 May 2026 14:09:23 -0500
Message-ID: <177869936446.1496622.13590516840997637362.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260331200658.1306-1-mailingradian@gmail.com>
References: <20260331200658.1306-1-mailingradian@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 78135539AFA
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-36789-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[kernel.org,vger.kernel.org,gmail.com];
	DKIM_TRACE(0.00)[kernel.org:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Action: no action


On Tue, 31 Mar 2026 16:06:54 -0400, Richard Acayan wrote:
> This adds support for the LPASS LPI pin controller on SDM670, which
> controls some audio pins (e.g. TDM or PDM busses). The ADSP patches are
> not sent yet.
> 
> Dependencies:
> - SDM670 Basic SoC thermal zones (devicetree nodes are touching)
>   https://lore.kernel.org/r/20260310002037.1863-1-mailingradian@gmail.com
> - Support for the Pixel 3a XL with the Tianma panel (for reserved GPIOs)
>   https://lore.kernel.org/r/20260310002606.16413-1-mailingradian@gmail.com
> 
> [...]

Applied, thanks!

[4/4] arm64: dts: qcom: sdm670: add lpi pinctrl
      commit: c4b423835ee7529854ab39b50cf766bc4c6b4d66

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

