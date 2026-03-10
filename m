Return-Path: <linux-gpio+bounces-32916-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IEvGKCUDsGkWegIAu9opvQ
	(envelope-from <linux-gpio+bounces-32916-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Mar 2026 12:40:21 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 45D5C24B436
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Mar 2026 12:40:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id BDA1430A0C6B
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Mar 2026 11:32:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DCD3243D515;
	Tue, 10 Mar 2026 11:30:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RMDtP8Bb"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E5A24301B8
	for <linux-gpio@vger.kernel.org>; Tue, 10 Mar 2026 11:30:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773142202; cv=none; b=t2N4sZtb+llbdAkwgiWMWp9CUABTER+6+6zGnJ66S89qk7rL1p0FShNqdkrE5oMihJ1ybbvE4W0QRg096vkdbDgiGfeyyStd8FdBBSxXdfU1mKoaEq+ELIfpeditEdjVhIgA9rWEFICZG5VrupG2IE7SWTs2KgI2HzWvAWUoqjE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773142202; c=relaxed/simple;
	bh=cXst5rDUoPvdqrpxymDWEEc9mpgs2kGim/gpZkCBJgg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LnygJglGFtGAioskD6ciS/1oUqXUXMuDYTPKF3BG5vifv/dh9WWThTEHp2BXZcdIAGfjfWhjCAI6uBWb+hX0VIIbt+N5/PXOdfJYz8nVGG9TniA9a/azcRfixd4TdIFD46929MQye4sXHiaGTPpdVBWYyNE/Zu6cn4YDvrNhZvo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RMDtP8Bb; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73814C4AF0C
	for <linux-gpio@vger.kernel.org>; Tue, 10 Mar 2026 11:30:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773142202;
	bh=cXst5rDUoPvdqrpxymDWEEc9mpgs2kGim/gpZkCBJgg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=RMDtP8BbL7f/JmCmROobdz9CVTjd0dP8jtyXMurtE09BGBnAS39/UyftU+vsdu8ah
	 nnDAVdVhRxWoyXcAAhxFHfgT+Fri5PVDfr0k1pPapj4DLeh0ZjGDyv7DOt8r8O6i+O
	 PUQrKQv70RxZ2PpjNF5sJhQuD//CggsOXeb+ErkIeOc8ibcM0pNAXoyPm6NQ0LTo8l
	 IxuelO+nUen8ykTE6J2uQGePwDz3AhiYEyy0eifqRu+gYLUo+vnH1NznciIWnpUJuC
	 Mf8iG0s7Ua43CGGB7F4S7XOpioZ3MLPhObQZfPqllHAUIq+r7YjJhSME52eQESU0FI
	 befMcImB1bETA==
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-7985ce90542so122407347b3.0
        for <linux-gpio@vger.kernel.org>; Tue, 10 Mar 2026 04:30:02 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUFHfugijHhibZ9hOQugQWzXBHVA9+CZCzB7pSRDbDhMAiaQp3LlayfLmIq+APu2vdvD6kGCU20SJyL@vger.kernel.org
X-Gm-Message-State: AOJu0YzQFLxlN73YBZvdNnU4NeLYcaXnMqGpqQ9rgQtoy8Ui2Qcn9nBM
	OHtygoux/vVMCLSKFzuiSpJOskkM9VyNU/V6VZd8/JTe1veYA+HAb6vG6HnBBMIkuktJtw5us5L
	pIvCgfZQhhHy4g3H4bhoRsEBMZxIG7sc=
X-Received: by 2002:a05:690c:4d47:b0:798:980f:6756 with SMTP id
 00721157ae682-798dd7c381fmr144551037b3.54.1773142201686; Tue, 10 Mar 2026
 04:30:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260306-milos-pinctrl-lpi-v1-0-086946dbb855@fairphone.com> <20260306-milos-pinctrl-lpi-v1-4-086946dbb855@fairphone.com>
In-Reply-To: <20260306-milos-pinctrl-lpi-v1-4-086946dbb855@fairphone.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 10 Mar 2026 12:29:50 +0100
X-Gmail-Original-Message-ID: <CAD++jLkhempB+rFJ4SyJicg2xLMyBZDWXiXxg6s8emtxx-0ZfA@mail.gmail.com>
X-Gm-Features: AaiRm52g3-f91Api_ApII9vjzn1qgVjFG5MugyiAL3Ri-_UEyn-YzxD45IIsNDY
Message-ID: <CAD++jLkhempB+rFJ4SyJicg2xLMyBZDWXiXxg6s8emtxx-0ZfA@mail.gmail.com>
Subject: Re: [PATCH 4/4] arm64: dts: qcom: milos: Add LPASS LPI pinctrl node
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, ~postmarketos/upstreaming@lists.sr.ht, 
	phone-devel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 45D5C24B436
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-32916-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,fairphone.com:email,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Action: no action

On Fri, Mar 6, 2026 at 3:22=E2=80=AFPM Luca Weiss <luca.weiss@fairphone.com=
> wrote:

> Add a node for the LPASS LPI pinctrl found on the Milos SoC and define a
> few pinctrl states that will be used in the future.
>
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>

Acked-by: Linus Walleij <linusw@kernel.org>

Please funnel this patch trough the SoC tree i.e. Bj=C3=B6rn.

Yours,
Linus Walleij

