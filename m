Return-Path: <linux-gpio+bounces-34877-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mIlgFLkO1mmxAwgAu9opvQ
	(envelope-from <linux-gpio+bounces-34877-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 08 Apr 2026 10:15:53 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AD24B3B8DD9
	for <lists+linux-gpio@lfdr.de>; Wed, 08 Apr 2026 10:15:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 78F583011C7E
	for <lists+linux-gpio@lfdr.de>; Wed,  8 Apr 2026 08:15:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1CD7939EF06;
	Wed,  8 Apr 2026 08:15:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DjJUWZ8p"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2F8E39DBC0
	for <linux-gpio@vger.kernel.org>; Wed,  8 Apr 2026 08:15:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775636147; cv=none; b=O1MpknbhU2ge+QmFtBw9ZTHfKSI+MvXRsbZrycBWgqO0Z0z2SsSiJNA72MLlHJd2ieMYLLGvI9qUFCkeSGP9khTbS6y/z8snaaC8vvq/BVdiIA6cfN+OZDioK0R7S6iKg7MCFMcaEx0899XK2Z1FR9D2dVSTAqg8kYIoT+lp85k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775636147; c=relaxed/simple;
	bh=Z1Ts+VSZ8ou/NVe55RhyiohrVm9KZyDeSwhovMasKD8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ld/mScIuLrDHyIsOpxMnPr9kt5Qd/a0MmQ0QWYIJ/WtnH2exCeD1EbGJO23qYbDpChWYAprDRWfiUTKIliN3Wta2uWjMtR4J5g4me4l+lPza/k8NXvxQGQ/PS+BJ6C8aYHWMPZs1zKK8JQzb3q8PcJoUUY6VLLvsJftc0lhAFWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DjJUWZ8p; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9EA74C2BCB6
	for <linux-gpio@vger.kernel.org>; Wed,  8 Apr 2026 08:15:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775636147;
	bh=Z1Ts+VSZ8ou/NVe55RhyiohrVm9KZyDeSwhovMasKD8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=DjJUWZ8p+SrYZMJe8a7MP/eKq6noIw+mM8ZBQN2VSSPp7t8H4gTwqMDq/NJVd0jjK
	 XROF5dzZrwwfVLsMfdCa5K8zQVWscKCo0yn06R/meLJiSxRz/PluiLBKTx3IS4kD44
	 D2JGDmNXuXVV2wJ0nt68vInXT/6LPHFQZCIbZMETGRmapO224VQUkLwOPr/btLV/J7
	 Q3LtR8MajB6r0oEDBU4o2elNrokdZdV4kslHPn0M9aUj4qTB9dLlNSe2s2Rr1P2rNo
	 uxSAVIif+Uh78xnf69h81njib6Uf3keCxOm9dTpEhfNSnvXuAzkuIIcgbMQxb81AdW
	 /vvmbiJZjmT5g==
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-79853c0f5b9so94813927b3.0
        for <linux-gpio@vger.kernel.org>; Wed, 08 Apr 2026 01:15:47 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCW1jkOfgmDWR1sSzYMWC0uLPsQQlnHNPjAC+RBVVTX/FszxyjG7fnno2iu5l1pY8mNKQBUJ0QXhKECw@vger.kernel.org
X-Gm-Message-State: AOJu0YzrCCZxa/J2q94CYux0boHTr5AcyYDtXMn1KaZPcQWX1PdKtvIg
	uP+fLq5Rn3Tt3qnGd9U7NNsGZeNUlm85VUKeYZ7QcByPVOWDUDV7nWf7b8eDIH4OrjD0dR7gAIz
	xqpDGb6MVZrNePckj1ef24dYR//Hs8XY=
X-Received: by 2002:a05:690c:12:b0:79e:21eb:e9ca with SMTP id
 00721157ae682-7a4d566ad29mr202825207b3.30.1775636147018; Wed, 08 Apr 2026
 01:15:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260401-waveshare-dsi-touch-v1-0-5e9119b5a014@oss.qualcomm.com> <20260401-waveshare-dsi-touch-v1-13-5e9119b5a014@oss.qualcomm.com>
In-Reply-To: <20260401-waveshare-dsi-touch-v1-13-5e9119b5a014@oss.qualcomm.com>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 8 Apr 2026 10:15:36 +0200
X-Gmail-Original-Message-ID: <CAD++jLm1kjuodURGsQt9ChA11zKJPf9Eayw7dy7LN_fdfWoAGw@mail.gmail.com>
X-Gm-Features: AQROBzDH7UQOKJUwrcrXsozOYhM9A3Hna5Srzfu5ji4HDrC0JSqqCxNeZwfuyJ0
Message-ID: <CAD++jLm1kjuodURGsQt9ChA11zKJPf9Eayw7dy7LN_fdfWoAGw@mail.gmail.com>
Subject: Re: [PATCH 13/19] drm/panel: jadard-jd9365da-h3: set prepare_prev_first
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang <jesszhan0024@gmail.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Cong Yang <yangcong5@huaqin.corp-partner.google.com>, Ondrej Jirman <megi@xff.cz>, 
	Javier Martinez Canillas <javierm@redhat.com>, Jagan Teki <jagan@edgeble.ai>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, dri-devel@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34877-lists,linux-gpio=lfdr.de];
	FREEMAIL_CC(0.00)[linaro.org,gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,huaqin.corp-partner.google.com,xff.cz,redhat.com,edgeble.ai,lists.freedesktop.org,vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,mail.gmail.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: AD24B3B8DD9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Apr 1, 2026 at 9:27=E2=80=AFAM Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:

> Sending DSI commands from the prepare() callback requires DSI link to be
> up at that point. For DSI hosts is guaranteed only if the panel driver
> sets the .prepare_prev_first flag. Set it to let these panels work with
> the DSI hosts which don't power on the link in their .mode_set callback.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

