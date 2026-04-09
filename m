Return-Path: <linux-gpio+bounces-34931-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gAEZAXVo12myNggAu9opvQ
	(envelope-from <linux-gpio+bounces-34931-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 09 Apr 2026 10:51:01 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id E1B0B3C7F79
	for <lists+linux-gpio@lfdr.de>; Thu, 09 Apr 2026 10:50:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id BD982300BC41
	for <lists+linux-gpio@lfdr.de>; Thu,  9 Apr 2026 08:50:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C06CB37EFFE;
	Thu,  9 Apr 2026 08:50:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="n9JoTSj8"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8134C33030F
	for <linux-gpio@vger.kernel.org>; Thu,  9 Apr 2026 08:50:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775724650; cv=none; b=kVv37KxT0vVl2fkE/Rj/cLdC7GgALTEW0DGheFqMWijRTIWU6VXLwu1tnckpSK7wnG+aMY0ufyx+3oTd4jqzfc57Fae+/vjCFBFH6nfKdUpiLL8peb0iIU7l3Axz7U6yS69U1jA14HT7eRtyy808KAiRmzdRpzTI4lMdDTFSI7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775724650; c=relaxed/simple;
	bh=it8N9QiPAQ6bG4oSqDUwnWos44xYZQNt5vVT1HI+p3I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MjPpQ5+7GMAo0nBvJsjqJUNWeWy2P08+box49zg7XjCq4J5N27ypn6cLPT1X7EBU5qMSP6965lOyuKW8eu0TxHY3HS2N3FDsfxEbsfeokfzG0zZIBw8DfyHvpXkj93DrrNK3FclCBmSE10iwm8xv20/AN/CNjFdGdaf/NB3ZMHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=n9JoTSj8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2899FC19424
	for <linux-gpio@vger.kernel.org>; Thu,  9 Apr 2026 08:50:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775724650;
	bh=it8N9QiPAQ6bG4oSqDUwnWos44xYZQNt5vVT1HI+p3I=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=n9JoTSj8wEDvUoGHnm+uD3ee5K+cpRk5z1FgTVC7GLA9HNmIriL9zeroJPWPPZxGb
	 qlPZXKVcpS8T5Rg1HnCr7mWuO3EBXMTJivRXV86yR23DboCM8hAlMmh5F8BEdiXLbs
	 z8WpfBy9Bwbxoe3hPYUGbC0P6GlV11GiDbWMVxHzT6yeMkVw1+kHSmW/dPJJ3O1ekF
	 iUIVTx3M/LwFZlTZ5D4NSB7Nh7DvyUtnBWEACP4iVAb+IP7J+FBMV0EBL3ENtKjF/q
	 RUHb2LJkeGl9XS5PQ7EvkhK2Kzs/g+6T9vTbiG60ekL9a94VR2r/qWMxnlusFKH0Zy
	 d6iRmuholPChg==
Received: by mail-yx1-f49.google.com with SMTP id 956f58d0204a3-6505ef94043so654757d50.2
        for <linux-gpio@vger.kernel.org>; Thu, 09 Apr 2026 01:50:50 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWgcveh+EHQS7MdotiQHK5lxtcoaqhE6l9MOE6B7IMozPObMKC+H1xqRYztxw/6cT5RI2wMiZYEzgNV@vger.kernel.org
X-Gm-Message-State: AOJu0Yzmz8WM1TzL0l9Xq0EIQC0rsCQKxPEOOiC/PLzXMOgxgYXtmz9O
	ykBT6LPmjAa2m1H1dNDqNnov4DmnYN7WLDu3ZQ/S8lvnJtG7TN9ct7F3wrpiSPDcb3R/cZaIIdq
	GGqliJ1Rhjrih/RtLpwrof7Wl4k7osuM=
X-Received: by 2002:a05:690e:4419:b0:650:2ff9:d681 with SMTP id
 956f58d0204a3-650488b4a4amr16332676d50.68.1775724649517; Thu, 09 Apr 2026
 01:50:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260401-waveshare-dsi-touch-v1-0-5e9119b5a014@oss.qualcomm.com>
 <20260401-waveshare-dsi-touch-v1-14-5e9119b5a014@oss.qualcomm.com>
 <CAD++jL=jUd4sQ1bhwcBRYpFFApP6vdJw2BoQwxoWShUKdEb9oA@mail.gmail.com> <z3obsnbmdvvlzs3cxm57osbax4ivg2zq2zk6xgp37n4hni7y6i@smwn362nhn6a>
In-Reply-To: <z3obsnbmdvvlzs3cxm57osbax4ivg2zq2zk6xgp37n4hni7y6i@smwn362nhn6a>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 9 Apr 2026 10:50:38 +0200
X-Gmail-Original-Message-ID: <CAD++jLnXJKKv5ghRnCcMTU9g984seJAMHyL6VWWV0Bv+dv01wg@mail.gmail.com>
X-Gm-Features: AQROBzBsoNdPYNsMvGgzeGYog6ZDiTw-eucSP-xx3bid1He95rIDmnyN8FEvCgY
Message-ID: <CAD++jLnXJKKv5ghRnCcMTU9g984seJAMHyL6VWWV0Bv+dv01wg@mail.gmail.com>
Subject: Re: [PATCH 14/19] drm/panel: jadard-jd9365da-h3: support Waveshare
 DSI panels
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
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34931-lists,linux-gpio=lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.997];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,mail.gmail.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: E1B0B3C7F79
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Apr 9, 2026 at 2:49=E2=80=AFAM Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:

> > But there is also one more thing, this looks like a big "jam table"
> > with just register+value tuples, so construct something like:
> >
> > struct jadard_jam_tbl_entry {
> >         u8 reg;
> >         u8 val;
> > };
> >
> > static const struct jadard_jam_tbl_entry jd_3_4_c_init_jam[] =3D {
> >         {0x00, 0x00}, {0x01, 0x41}, ...};
> >
> > (Ideas taken from drivers/net/dsa/realtek/rtl8366rb.c, take a look
> > for code and all, you get the picture.)
>
> Few months ago the code was moved exactly in the opposite direction. We
> added all _multi() functions and made shure that the code is as
> efficient as the register tables. On the other hand, having it as a code
> allows better control. E.g. handling 2/4 lane case would require extra
> hacks to the register tables, while the code handles that without extra
> hacks and without loosing effectiveness.

OK then sorry for the fuzz!
Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

