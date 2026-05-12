Return-Path: <linux-gpio+bounces-36700-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sCjWNxeOA2pN7AEAu9opvQ
	(envelope-from <linux-gpio+bounces-36700-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 12 May 2026 22:31:19 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 611A1529355
	for <lists+linux-gpio@lfdr.de>; Tue, 12 May 2026 22:31:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DF551315C264
	for <lists+linux-gpio@lfdr.de>; Tue, 12 May 2026 20:26:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A32A3D3D14;
	Tue, 12 May 2026 20:23:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pNx71Kbk"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF6043D2FEC;
	Tue, 12 May 2026 20:23:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778617431; cv=none; b=Msn68XnTUn3eS13oMdE5rDw3+yMQxwhAWGsHaFd8eZ1TikWNC3ygtr7JP8qopRbTcdghAwurBEBdSUQxJ3RScqbmrairv/6aVqhQAt+6BCkQ3WbFLpVe/iDexREZIlHQ3uv78RAFy3TL9Nxq/9mba6dr8usR/lLPIyAMy1h6v7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778617431; c=relaxed/simple;
	bh=r7C8okDrmZ4V85cTOZoFCuRzK0Plr6eNfjzzPe5Y3hw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mZzfXsGiMg4elccjLfjq5haoeP2qYoAvdpmX9Kt3vtHxkfoN8brdV98AKDceI3zT5NFwyV7m/gCWkyv4eIkkNEz2LKCTx6110b6krOitfYau8NyNf5Swb4L6PQRdg2Vp4T/F/wWXPUlymQjhfN9Ed758SvPf8QB0qNzdsy433dw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pNx71Kbk; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79988C2BCFA;
	Tue, 12 May 2026 20:23:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778617431;
	bh=r7C8okDrmZ4V85cTOZoFCuRzK0Plr6eNfjzzPe5Y3hw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=pNx71KbkOBZo/0s/F5gr5GeW6TcXz1KY3rTJscM5YMiS0SHwrVUW1NeCzDRTXPk6V
	 J6hJxeLzxz5fsonWz2Ma4+Q4oaTxWH74Zx6J3hMpLZu6n76iD3do0ATeb+SzW0tQbk
	 aIMB8Xfhl+Bh21a6iEAklzb2woXwKYQnFTU7tFCnhPHdDgiXuHEcs/naaEZ5SWo9DE
	 FAMF47Z2M3EUEcYhHOFLVzcB3vMNqJLW97oyMn5RPlTXsLBTOP19lIXNxDMGifcElN
	 PR0LMKTATVLi2ONtWk3V1tNj65RWlFo6EC8osCK2B0EW8bkk0hIQ1v7eCEyhWHV+2r
	 DcgZIH65SkPoA==
From: Bjorn Andersson <andersson@kernel.org>
To: Linus Walleij <linusw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
	Luca Weiss <luca.weiss@fairphone.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht,
	phone-devel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: (subset) [PATCH v2 0/5] Add LPASS LPI pin controller support for SM6350
Date: Tue, 12 May 2026 15:23:03 -0500
Message-ID: <177861739372.1242344.6203003940273712177.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260430-sm6350-lpi-tlmm-v2-0-81d068025b97@fairphone.com>
References: <20260430-sm6350-lpi-tlmm-v2-0-81d068025b97@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 611A1529355
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-36700-lists,linux-gpio=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action


On Thu, 30 Apr 2026 09:10:40 +0200, Luca Weiss wrote:
> Introduce support for the LPASS LPI pin controller for the Qualcomm
> SM6350 SoC, by adding the dt-bindings, driver, dts bits and enabling it
> in the arm64 defconfig.
> 
> The custom slew offset for gpio14 is described as
> "qcom,lpi-slew-base-tbl" in the downstream dts[0]. I've tried to find
> some reasonable solution to have this handled correctly in the patches
> here, but suggestions are welcome how to improve the situation. There's
> of course several ways to implement a solution for this.
> 
> [...]

Applied, thanks!

[4/5] arm64: dts: qcom: sm6350: add LPASS LPI pin controller
      commit: 630398127110753474576cbc0cd4ad102b18005e
[5/5] arm64: defconfig: Enable LPASS LPI pin controller for SM6350
      commit: b1b08554e3be97712febad9d4d9ad617a1a32af1

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

