Return-Path: <linux-gpio+bounces-38342-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id z33QAyeqKmqRugMAu9opvQ
	(envelope-from <linux-gpio+bounces-38342-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 11 Jun 2026 14:29:27 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 74EFA671D68
	for <lists+linux-gpio@lfdr.de>; Thu, 11 Jun 2026 14:29:26 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=SnlHs3vu;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38342-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38342-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2271330EF285
	for <lists+linux-gpio@lfdr.de>; Thu, 11 Jun 2026 12:26:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1EFA2F12DA;
	Thu, 11 Jun 2026 12:26:19 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 096B23ED5D0
	for <linux-gpio@vger.kernel.org>; Thu, 11 Jun 2026 12:26:17 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781180779; cv=none; b=RHJvzhGk5sB4OINE/mJHT/JupyGgnGxkJocbJMp4KFfWSfBd3/RGU4nefd6AhbX17tkbdqIRv+wzIeHMD6WMMH2VTDULMkOTV7z8StxXEi54lA7US7YKw0V75c4pgXKPatpaWjQ5JgvGsxwak1nS3d+UtuZQPr+wHzYQ6vbQ85c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781180779; c=relaxed/simple;
	bh=g/VnuIKvkGWSAajf8vvIgUd13LyTGZr4shl0aUhfam8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ugda573iv/aYWExjsYHVHewDLreOWvCJ4Zclcb0TQGyMHaV4QpgF+vlZ85EiTgmo+Vkuf/0xxZkUFNoGUUuQsQBxPImrlRrcxe5gCinV3Dp2FE3OjwHpB5462tqa8bfClLGOhVc39ajl7s6aCmM/k1fGngPS7npFs0xXlldjNqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SnlHs3vu; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D099F1F008A0
	for <linux-gpio@vger.kernel.org>; Thu, 11 Jun 2026 12:26:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781180777;
	bh=Nj6I30dESBei2Zmp1z0LfF/1I7GCQA0Q3yZdhfFji1I=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=SnlHs3vuJPcJW75myJnz3dI4AwoX607x4PnuASHDNWxd28IFxcdcFVf/1P7kLzdvu
	 DvJpAMullkHv6B4OijQvNEyBpRxRTaPYwpIGPlzdSOvNsFGSBlsb0kVjrqTxuWeXVw
	 xtBOpjHiysyHhBYOpwaP2X54HdpJaahbYXByLRHb8wbf3A4hqIjolX6auq26e2Fv3s
	 CFJ1Wrc+j1E/XRsDyAiJg05zC/44qa+5k+yWpYSdnL2o3n5USwz8jyfEMvJ1ExZ5WY
	 pkg7EyKleS4vpAiYz1qIMTf/AOpycZwOJCC+YthxdPuZAVI+QdWQxunCzgxIqXZnpo
	 T3c3vBBCX0sbw==
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-3967717c951so84450431fa.1
        for <linux-gpio@vger.kernel.org>; Thu, 11 Jun 2026 05:26:17 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9QJJUOGi+uS+OgfQ8n1KREr+D4HNgTyR07QaEiSRwK60AB0AhQtfMgZnfepuNyetczauNAxNj9sKNV@vger.kernel.org
X-Gm-Message-State: AOJu0YwbZOeTDA0WZ5RRf+96c1JrBqq+Pnc3RQt6pT0+wXSIse9cscRz
	PN4NZcG1QWoqRSK07EVAQgwE05BShj/g58pAc1zjnYfxwX6GC9aFGl+xnIL2GTnJmmwbGTU+5tB
	epqoWfQyawUIILLjp9AJRU9ywm0vIvzw=
X-Received: by 2002:a05:6512:1282:b0:5a8:8db6:b3d with SMTP id
 2adb3069b0e04-5ad27ae3258mr738931e87.24.1781180776604; Thu, 11 Jun 2026
 05:26:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260610-pmg1110-gpio-v1-0-a9c50cd8b5d9@oss.qualcomm.com>
In-Reply-To: <20260610-pmg1110-gpio-v1-0-a9c50cd8b5d9@oss.qualcomm.com>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 11 Jun 2026 14:26:03 +0200
X-Gmail-Original-Message-ID: <CAD++jL=SSUOZTyE29C_z0Gj_1iKgdLnqWaMQc5BKdsY1h5OAUQ@mail.gmail.com>
X-Gm-Features: AVVi8CeqWNRQFQ5gUdmKUsibk9c4XCoQP1UEG8vW5TTxaputcf1j1B_Elc7vDYQ
Message-ID: <CAD++jL=SSUOZTyE29C_z0Gj_1iKgdLnqWaMQc5BKdsY1h5OAUQ@mail.gmail.com>
Subject: Re: [PATCH 0/2] EDITME: cover title for pmg1110-gpio
To: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	David Collins <david.collins@oss.qualcomm.com>, 
	Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>, 
	Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>, kernel@oss.qualcomm.com, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-38342-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:fenglin.wu@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:andersson@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:david.collins@oss.qualcomm.com,m:subbaraman.narayanamurthy@oss.qualcomm.com,m:kamal.wadhwa@oss.qualcomm.com,m:kernel@oss.qualcomm.com,m:linux-gpio@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:konrad.dybcio@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 74EFA671D68

On Wed, Jun 10, 2026 at 9:05=E2=80=AFAM Fenglin Wu <fenglin.wu@oss.qualcomm=
.com> wrote:

> Signed-off-by: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
> ---
> Fenglin Wu (2):
>       dt-bindings: pinctrl: qcom,pmic-gpio: Document PMG1110 GPIO support
>       pinctrl: qcom: spmi-gpio: Add PMG1110 GPIO support

The series:
Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

