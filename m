Return-Path: <linux-gpio+bounces-31417-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EM8lCv+qgmkMXwMAu9opvQ
	(envelope-from <linux-gpio+bounces-31417-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 04 Feb 2026 03:12:15 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 99F01E0B7A
	for <lists+linux-gpio@lfdr.de>; Wed, 04 Feb 2026 03:12:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8736B30A4E0D
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Feb 2026 02:10:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E19F528726E;
	Wed,  4 Feb 2026 02:10:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a4QlwfrQ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 669E724A054
	for <linux-gpio@vger.kernel.org>; Wed,  4 Feb 2026 02:10:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770171031; cv=pass; b=MQHCVlanSMH0AaO6cjreMKNdzT6ILQoRUIOMu1PMJ2PTqwiu1iofUfKXO71B5RdEClVOxwitiHFVsm+8QHB0dyMok6fz5uyYgFaxXmojRB5Lb6Ehoc5vef00wyYh5ddFjgIc9cYrxbyMsGtAuUttRHDsG3ITkTmeNs1AI4NL+qg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770171031; c=relaxed/simple;
	bh=cOu6uSR745S9+bQAypkT0QxhUNvKeyxB46bdyuWtD/Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=J2YKqpHpjzJD1UXujzlytLK5ZQ8ZLyuNrxwwyNpJIFgwKuDAcOEZl9zi7YMFreKYKhuT5Ydw6hVrotTEoqJhnL4W/dJQL2AMlIwsDFXi+4prAk7JpxO53vz1YiWq0UP3ZpKyog4rkECImNat6z82PDCqQEDqerZ8yN6gW0G5lek=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a4QlwfrQ; arc=pass smtp.client-ip=209.85.160.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-5032e951106so49324361cf.0
        for <linux-gpio@vger.kernel.org>; Tue, 03 Feb 2026 18:10:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770171029; cv=none;
        d=google.com; s=arc-20240605;
        b=hI4lzMWV9IAfBk7dMRM0gtu5+1lkNd9MbehQxPxpicT0hWXHhTKYbyEKIdKWMWd3fI
         wp3B32de0Fx77x5B142cDDSczSeAaLauQKAAYfrn5YjoSqQdbhTdIVrWYOpKTIAK0qiu
         Qd1+Si7qhbpic++BRNXIrlFZU6QTDxaxT7YTk6UrQigVGVW9PcQPFJ1IrIU2rDew1Jrw
         +BWyn5JAJGpvn3PnHvmQwZE+KNW3XzLnsIeYb0UnlMN9SJhhGPx/IUBWfF0GhdZcNR39
         oe/idXr4zoNuUkQqLJyUwiOxs4U+3+Lwz9mb2/1MYmnqEe9mluZrdJvqXkla0F4PvLDO
         b5VQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=cOu6uSR745S9+bQAypkT0QxhUNvKeyxB46bdyuWtD/Q=;
        fh=onBN6tdzkCQ+OlhLh9dNbP6Q1ofmxBFyMTGb5X27QuQ=;
        b=HrAWwUBfv/3U+CGKWb1pqDpyWGZVerDAbnwGfjJfFyMzBF96vZGvb+vdJvSN0e/M3u
         d+6g0uJWTubkheFk+YqBNLY/sEmS9SPVbXUUDQseVF1x71IEH/os/5ADvRr5C+yZciy3
         5/pdX+TmJF+NNQaYZdA86JOxxfNy/0C4sBIkV6eZtkbhglnWsVj+L75HHwVKdxU1WvJp
         bX+izIZSDibvLtZBx7JuNm/5nEVKyOrccMdFPsSLudHPgIiVsytw1A/vCKcAoeeqFb7d
         3xaitwo84C8fYu+duaQnrshOLmCs8i0JYz65U8bzNiUPFE1K3KUpt1rkTF2niOIXC2B+
         swWQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770171029; x=1770775829; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cOu6uSR745S9+bQAypkT0QxhUNvKeyxB46bdyuWtD/Q=;
        b=a4QlwfrQdbawd7PcEJmNLWn2XVL4fUO989WYwQBgALhe0nq71vjv2eZstej85vlf90
         wJkJifXbDvody0A6hW04KrYaZqG4lcbW89ZRH0NcBvJbuMkL8fbNsa9TFW7zk+TBm7tf
         trDWondDSWWtHZ1MHAeenqj/6oBMON3sDKwTZeTw7CXdzC3xVeO5+yfREYoVsh7+r0f+
         zdsiegK3aiu1+tejj6Y84j2RbnaPFU29dv6Ki+TNn5GWc9i1SpkbcYn/t2jGj8pts0MY
         /yVb001JgZZECUuS444RwfZiRPFmaY71J9MnsVhETxaD00n5W/elFIDzbKA2xwFvKeOL
         Aoew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770171029; x=1770775829;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cOu6uSR745S9+bQAypkT0QxhUNvKeyxB46bdyuWtD/Q=;
        b=DLbq344fza8x7YEA+xnXAl52E7M7EfgLSs610yO24pr6VrJZOA4mx4WXLt1gkofnEA
         tnPA5F4t7Du2nkVX1g6tMCIYno5gb9sPZ5j3JanJRx5O7+UVTCoFpBvwDx7CQ4gI3YER
         3YkJTupZe/bdrQ0d2L6dFtZMRXNBTA+j0bxx4UDX7mq6DzID4cBd9XS1qG3Xdw8ORg0L
         1pXKgyvtwrcPLwsQIzuKeDoKNZMZGETRlixHiRPVe9YNdFjfMdwSgrE0XiO/o0xsMu0+
         Bqfjh0zuGpxNgk7C7mmqDX6qIcPFPTl9aU3H/esQkZMW4EsHej1MKsvLFkhqw7lK8+OP
         TYUw==
X-Forwarded-Encrypted: i=1; AJvYcCVyxADU3XDxSeEIzvtIUrvSEURePVL0nFocUM8D2XQ9COMJ0ly3ODYTQJKU2OlIXL1tqO3JC1n6amWi@vger.kernel.org
X-Gm-Message-State: AOJu0YxV1I0evzEEXDmkOYIkYUcoOVKuOrLdH0RQo72iVdVbrC4+am7F
	JZPq9tB9oK6p5u3UdyUZNTzdqV6jw4MVBsaBsaku5NjcEx7UwK5ik8y4WPVgUIPU7YU5wgyXtLQ
	TN8XM0mol0yk2cKHLbxNOp/IhBeTqf4w=
X-Gm-Gg: AZuq6aIhdKaPHPK0iEMN9r9jtiVgXoz0/HWZ79l8lF6G2su/WD4yyE+jJ91VqSV1EJ9
	URBF+iVanXnNFOurhT34yuyrKQR/flaEO04D01GfoHFJjOR49J7g/UWVNgy5v9euM5NjLzADAgT
	/CZTXgegYsEf79lQMZlytfAfDrqOk6/pcT/FDnYDo0EDonmrQPzKlvST3RgIvs+b8dSIcU24Kq5
	Li36fWgYO3e833PN/vF01asVwykWnTZCqvQStiqjNAvQYb+4LFih716uyDnN3o6LkWr94Ka
X-Received: by 2002:ac8:584a:0:b0:4e7:2dac:95b7 with SMTP id
 d75a77b69052e-5061c17fcabmr19066391cf.37.1770171029420; Tue, 03 Feb 2026
 18:10:29 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260111053025.251983-1-akkun11.open@gmail.com> <CAD++jLnG-GGxmGMmojYwSE4T3F1NjCDY-f0+CFC_Fi5gMA9v6A@mail.gmail.com>
In-Reply-To: <CAD++jLnG-GGxmGMmojYwSE4T3F1NjCDY-f0+CFC_Fi5gMA9v6A@mail.gmail.com>
From: Akari Tsuyukusa <akkun11.open@gmail.com>
Date: Wed, 4 Feb 2026 11:10:17 +0900
X-Gm-Features: AZwV_QgfvhSnRe6BSdFh2YHo7w__KWTzGBs-jRKflpMXQ7zpmGAbD_Bihr_xlBA
Message-ID: <CAKr_iV4jBCWepn+ve2tYXncUocsnLyqS2DSebW2Wu4=pkRs=Lw@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: mediatek: remove unused drv_offset field
To: Linus Walleij <linusw@kernel.org>
Cc: sean.wang@kernel.org, matthias.bgg@gmail.com, 
	angelogioacchino.delregno@collabora.com, linux-mediatek@lists.infradead.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-31417-lists,linux-gpio=lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,collabora.com,lists.infradead.org,vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	MISSING_XM_UA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[akkun11open@gmail.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 99F01E0B7A
X-Rspamd-Action: no action

Hi Linus,

Thank you for picking this up and applying it!

Best regards,
Akari Tsuyukusa


On Tue, Feb 3, 2026 at 9:34=E2=80=AFAM Linus Walleij <linusw@kernel.org> wr=
ote:
>
> On Sun, Jan 11, 2026 at 6:30=E2=80=AFAM Akari Tsuyukusa <akkun11.open@gma=
il.com> wrote:
>
> > The 'drv_offset' member in 'struct mtk_pinctrl_devdata' has been unused
> > since the driver's inception. Drive strength control for MediaTek
> > pinctrl drivers is actually configured via 'pin_drv_grp',
> > making this specific offset field redundant.
> >
> > Remove the unused field from the common 'mtk_pinctrl_devdata' structure
> > and its corresponding initialization in the mt8365 driver to clean up
> > the code and avoid confusion.
> >
> > Signed-off-by: Akari Tsuyukusa <akkun11.open@gmail.com>
>
> No word from maintainers so patch applied.
>
> Yours,
> Linus Walleij

