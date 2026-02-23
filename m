Return-Path: <linux-gpio+bounces-32018-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8BzVJ2cfnGkZ/wMAu9opvQ
	(envelope-from <linux-gpio+bounces-32018-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Feb 2026 10:35:35 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D878173FCE
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Feb 2026 10:35:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AF1B63021716
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Feb 2026 09:34:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B35B34F27B;
	Mon, 23 Feb 2026 09:34:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cXbmKaSf"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BE5434EEFA
	for <linux-gpio@vger.kernel.org>; Mon, 23 Feb 2026 09:34:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771839286; cv=none; b=YKSQ7IVqKdPlmW9f1p8BzPVCspXiCGffiOiqghmwbdqtyw8NPKMew9CYLI6B5m6kG6Do39ueOeCFbtKEaGGPofvNGjCvBfUm3wDi256sYk+90BKwLv0oR0b2Iuid3c+W3pHepvxlQY6FtmRgzJafb4SfI38N/MbDLHPK+2mIXsM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771839286; c=relaxed/simple;
	bh=8fAbw/p2dk8Yuclw1poW/4ki+YnssRA8w4NHiTcipys=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rQfWOfEldrQMnYTI0C+6k88llu4wTMnDeG1ZOwfyJ9uiBrBnbiiKLUbw1mHD9GE6WWX2FbiHjGUTbhezb1aYOc0rJkE8eTGZAAnMOxYycExxV7OoBpQ2YZebB55CLRwbpaziOWa6aGZcMubZnvh09rl0qs1NAvSw/cNQsSTOXsw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cXbmKaSf; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01DE8C19421
	for <linux-gpio@vger.kernel.org>; Mon, 23 Feb 2026 09:34:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771839286;
	bh=8fAbw/p2dk8Yuclw1poW/4ki+YnssRA8w4NHiTcipys=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=cXbmKaSfewFPO0ryF4zuPENLfjO1OT1mk6zxeQMteLWHX9ZsIKsXSFrAY8CllzMxF
	 YcB7q3oXFcu9/7uG9VeOlx4SquHXzGJJhpQnRwb8yQHEZYyt/MuSxeRqFiOqkayjfa
	 z1lh7pgUPesqNE2t7fB5l66DbDEFHDRqHiq9ScgpDYCOVti0uljV7ymbuWKcMOoavK
	 fHieOFNCFHjK3bUZj79JSDuwa7ds1k3iGj8EyrkbNdJSFXH346xyMykHmHKJ9lB/sc
	 z97zmKPmnBEQo7JRNdWiMOCca6sEYX42xvevVB3PmB5Pd4PBSbQkd9p9OwzOfL+Bze
	 /P4XQcnBnNrbQ==
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-79802e2c989so34757157b3.2
        for <linux-gpio@vger.kernel.org>; Mon, 23 Feb 2026 01:34:45 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUfWXhxIJCUpiroNwP9d7xO2BR8O/2fO65pnNKl2fUMtLTppdyf/Itl6YnhUpr4Izx8/J+Vs4LBrW8d@vger.kernel.org
X-Gm-Message-State: AOJu0YwkTOYiK0HWjEDcLHeEgtBd7k83mPQOKYGKKlf80wxG4vuIUyI8
	PVS8NWcdsCpS5sUosJZyGeRTlkNOzklH07wV1rWQ0cwCl34YGy3AUBwgcY3LJ1X1JnwSYlJXOU4
	ZW4S7hTyYEohDF22kATZVm3KqumcTdMk=
X-Received: by 2002:a05:690c:e:b0:798:2720:a6d6 with SMTP id
 00721157ae682-79828f1f2b4mr71858367b3.19.1771839285373; Mon, 23 Feb 2026
 01:34:45 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260209-qcs615_gpio-v2-1-ff15114d837a@oss.qualcomm.com>
In-Reply-To: <20260209-qcs615_gpio-v2-1-ff15114d837a@oss.qualcomm.com>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 23 Feb 2026 10:34:33 +0100
X-Gmail-Original-Message-ID: <CAD++jLnoruRX81EUW9pr4sOiQ-_VKxpUZPOkKMbXdu0X4a2f8Q@mail.gmail.com>
X-Gm-Features: AaiRm51nvigYAEuF0t493pvwB2OjWx1PlCXFOfH2JKpY5tR_fa6u-5stwCbrwzg
Message-ID: <CAD++jLnoruRX81EUW9pr4sOiQ-_VKxpUZPOkKMbXdu0X4a2f8Q@mail.gmail.com>
Subject: Re: [PATCH v2] pinctrl: qcom: qcs615: Add missing dual edge GPIO IRQ
 errata flag
To: Maulik Shah <maulik.shah@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Lijuan Gao <quic_lijuang@quicinc.com>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32018-lists,linux-gpio=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid,qualcomm.com:email]
X-Rspamd-Queue-Id: 0D878173FCE
X-Rspamd-Action: no action

On Mon, Feb 9, 2026 at 5:04=E2=80=AFAM Maulik Shah <maulik.shah@oss.qualcom=
m.com> wrote:

> Wakeup capable GPIOs uses PDC as parent IRQ chip and PDC on qcs615 do not
> support dual edge IRQs. Add missing wakeirq_dual_edge_errata configuratio=
n
> to enable workaround for dual edge GPIO IRQs.
>
> Fixes: b698f36a9d40 ("pinctrl: qcom: add the tlmm driver for QCS615 platf=
orm")
> Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>

Patch applied for fixes!

Yours,
Linus Walleij

