Return-Path: <linux-gpio+bounces-34878-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oO7FFOEQ1mmxAwgAu9opvQ
	(envelope-from <linux-gpio+bounces-34878-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 08 Apr 2026 10:25:05 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 150D63B8F88
	for <lists+linux-gpio@lfdr.de>; Wed, 08 Apr 2026 10:25:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id EEAFC3038D12
	for <lists+linux-gpio@lfdr.de>; Wed,  8 Apr 2026 08:24:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CDB2D3A3806;
	Wed,  8 Apr 2026 08:24:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="e+go+3hH"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 069303A453A
	for <linux-gpio@vger.kernel.org>; Wed,  8 Apr 2026 08:24:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775636670; cv=none; b=h0OjnU/SEW/n4rxNThrK/8GHXQ86ORs4ngTvEsdcieobwi/QxpmRfA41w5B5OSdXcHTM+mHd1jTTujTAW+cGYA4U5v2M6m7p126X8Rq8+r77qweK20/wV9GHhm6hw5UC1OtQ5Du2DIIn25QVmwqtAca+Gxvz6jc/EWv9JVKIOec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775636670; c=relaxed/simple;
	bh=p8snXDTvA83wx+z5qiKDkwfDO/dPo6ful3ps5EMzPP8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OuuGkDtS2hV5+Mpf+Qk02oQf3wLN6RPIa5rvX/hla0Z+geQJl2H5Vf4hAFI58Xk/lwPEyJX9Mx555siZo6hA9FrfmHBPWXwJrqNPEwochaG8/sQW8Z4rn7jULSeueKBL9TQjLKAkTmdvnAX+hrfL3WHMlzPNAHzbCStsnQwZGOk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=e+go+3hH; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90F4EC19425
	for <linux-gpio@vger.kernel.org>; Wed,  8 Apr 2026 08:24:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775636669;
	bh=p8snXDTvA83wx+z5qiKDkwfDO/dPo6ful3ps5EMzPP8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=e+go+3hHB/xrKR5ciAs/42wJnNe6RnqeQM6GogovQqEtjIrTxF13jYf0hD1yaxxHA
	 y4bvv2jrh3wZHzBtHS3zNaT8snvyFlziqw+XP+/WYNDgCgMJ+jVZ6fMhicI/iPUpqK
	 NTtGnrQhH2qgDF+tcjaMlW+KhTjUzBGAABPTKa669SZ629m1UA8pNAs2ocKtwrQ/Rv
	 vKB+IbKKR/1WPRA+zzQ6Z7R/Ff/D449+Bo/1cUTmskZywHwiFjaO6BoJjr1Gm3uh3L
	 EI3w+i5qytIVAWZulDA0lS1NaCpcHaGJFOxtHZstCbAXrVWkFCnVh3wFaYxL3V8P3N
	 EeZwn6SRVTRZg==
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-79a535e7c00so64437327b3.3
        for <linux-gpio@vger.kernel.org>; Wed, 08 Apr 2026 01:24:29 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVF8ZKCsIL4BOEHSeEeDNUQRc6lhWU6QhXnuVtSigPQnaicrEblDYDPAriQkaRaXBwCv3bYqwtb4Rg0@vger.kernel.org
X-Gm-Message-State: AOJu0YzSJsVaRLGbabgMU2niUd8X0rTqlani8okKAkXIoBbIv6rFIqht
	BSySxynEAKBrihF8z8aORapOgrcF9aUL0yCcelZktlZaVGXCRBRA7J5KxgCy9fOTY8FSe+9pZjW
	/2g8+IsBgC57FIOcKo8MH0j+qZgRj8tU=
X-Received: by 2002:a05:690c:3481:b0:79b:f4e1:a5b2 with SMTP id
 00721157ae682-7a4d6c2907fmr212257147b3.22.1775636669037; Wed, 08 Apr 2026
 01:24:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260401-waveshare-dsi-touch-v1-0-5e9119b5a014@oss.qualcomm.com> <20260401-waveshare-dsi-touch-v1-14-5e9119b5a014@oss.qualcomm.com>
In-Reply-To: <20260401-waveshare-dsi-touch-v1-14-5e9119b5a014@oss.qualcomm.com>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 8 Apr 2026 10:24:17 +0200
X-Gmail-Original-Message-ID: <CAD++jL=jUd4sQ1bhwcBRYpFFApP6vdJw2BoQwxoWShUKdEb9oA@mail.gmail.com>
X-Gm-Features: AQROBzAMBfnRdAnK4bRwU75AOx83F-jAcWPeGS0EtIQgTCQ0qxVMP0p6zzWqMTM
Message-ID: <CAD++jL=jUd4sQ1bhwcBRYpFFApP6vdJw2BoQwxoWShUKdEb9oA@mail.gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34878-lists,linux-gpio=lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 150D63B8F88
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Dmitry,

thanks for your patch!

On Wed, Apr 1, 2026 at 9:27=E2=80=AFAM Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:

> Add configuration for Waveshare DSI panels using JD9365 controller.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Some more words with details on all the panels added perhaps?

> -       desc =3D of_device_get_match_data(dev);
> +       jd9365da_switch_page(&dsi_ctx, 0x01);
> +       mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x00, 0x00);
> +       mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x01, 0x41);

Predictably I'm not very happy with all the unexplained magic and nonestist=
ing
defines used here. Do you have some info/defines?

But there is also one more thing, this looks like a big "jam table"
with just register+value tuples, so construct something like:

struct jadard_jam_tbl_entry {
        u8 reg;
        u8 val;
};

static const struct jadard_jam_tbl_entry jd_3_4_c_init_jam[] =3D {
        {0x00, 0x00}, {0x01, 0x41}, ...};

(Ideas taken from drivers/net/dsa/realtek/rtl8366rb.c, take a look
for code and all, you get the picture.)

Yours,
Linus Walleij

