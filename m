Return-Path: <linux-gpio+bounces-32860-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IP5dOCxDr2mYSwIAu9opvQ
	(envelope-from <linux-gpio+bounces-32860-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 09 Mar 2026 23:01:16 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 69AD9241FF2
	for <lists+linux-gpio@lfdr.de>; Mon, 09 Mar 2026 23:01:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 806563040F86
	for <lists+linux-gpio@lfdr.de>; Mon,  9 Mar 2026 22:00:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 489B336F410;
	Mon,  9 Mar 2026 22:00:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NMBqbxGx"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B3DC31197C
	for <linux-gpio@vger.kernel.org>; Mon,  9 Mar 2026 22:00:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773093631; cv=pass; b=bcEpDybTXIfCILskv4FoZNCMrbnJyTwXoCqcBvYwCbrgPqcm4+kgQFfz6pGp0NKJADWPO+iFB1tf+rgspnC6RV5RutiH9L6xmRNQqcIs0VNpgxQArtbJsD18TMlZC/KWMbAaOlgqnzP6rpN7kri9B9oDcAgron0/Os+Zi+vMJsE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773093631; c=relaxed/simple;
	bh=QphhNh4f7gkUbyN0Yk0KSmel1SMQBwACUum7u7vnrAI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ODkbcl66ocuG2l8Jecgxna00lvcgKNHmlVqamN0M9slg9UYU29VGWoZuXKBPlWutXRUvpKu/rFUFxP9ensTDlLcAgQzX2rcZw0OTcsZspOUu5LsWzj3Rp4MimZitO0YnW1Ry2JA46CleVjdRGS/i+JfcJQLFe7gVDJb6IBznQG4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NMBqbxGx; arc=pass smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-b941762394aso506682066b.1
        for <linux-gpio@vger.kernel.org>; Mon, 09 Mar 2026 15:00:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773093627; cv=none;
        d=google.com; s=arc-20240605;
        b=apApa3EZjlAOcNxNt6UKKQmq7jNSMsFLGLI94ie5Xratw8DhYG6Yb5pvaOm/sbGzHo
         sHs8V/HEipdVTfUDjUoeDQu6MqnyEyFN1w0oBobbU7mY3BdyLu1jaF2On+vRHezdvkRJ
         o+x9oi8Nmmx8c6CR7kI5ZBADPKgb6sIFmdE/llzed+3HnLPmfyYQp+sqTEMz8E998IZX
         vo8UZCY27bE0kbU8LJwiA2r107Ol5Sp8/EjrAUPUP3u3KJF1mb+13R9/gkK6Db/75hbO
         QPZdP6RQTFgPVaboTE1/xfTzxHUUxuxGNEGo7D001at9MBdZuLSFB4FiUoGF+jWNvTPB
         JEGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5D58sQUjXLLDfC4Cb+JyinMTeRDp8+6d+A4ebahMYHg=;
        fh=325Mg+hY6jJrz4QWOdIrQHVwX9Jzfo0DvgfYr3pZFbk=;
        b=H14cfTQWR8wZKlnCsYAai9uT6OkngEqOmzlxFOtDeUJEbAl2uSevbGENtXvDaB1CWs
         xphFHtitTOnH+ASUSt/jCciVSF4VqIZlY9LanP88k3qaSODq7SiMd1qqxIomIyBOLsQp
         xpJPHTaV7oWV+XPy0O6I4fkaqPV04idH6iso8EPBoQdhIRut+S/wxD8LwP/n7U57XD2Y
         BefQu6fx6AmEjl8Kv2y+pyQCs1ra4D3A7sW5jD1TxdgGOLiFEuTxdslz7PALfeunHK4p
         nB66hGDby09RPc7JH70AO/xckNygKYb/dtgaK1y0yy5LaVUj5TQsVPB2DvmghKcTDkkk
         sZlA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773093627; x=1773698427; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5D58sQUjXLLDfC4Cb+JyinMTeRDp8+6d+A4ebahMYHg=;
        b=NMBqbxGx3V2njBKM0R+jjEDpkzmA1Thq8/ZO95S47tl4QZXVPZXCp31o9ZRaygvLU8
         vHSGAH9tA1nY/37T785Zyr0XhKpW4zj75NsYt+7uJTycj8KZcTmTpECoBRid32apceIX
         DKsWw+72/gxtTE1/dPUzQvzALqz5USz3ZHFSQBahNHZgJn0k5UKfLedyTHawzBheCkHL
         HcWxVj/UKEFWYjDNS4hElZftJM2/U1Ze9hmBvxdcnWDhmAKMNAO8g68xVbLNccy9pR7/
         cRzyNeTdSWK5zRyPhx4cz2GPVROXpojvMT9HPx0oDp1gEnXEq3fAerjgLLuq7EsWFnvl
         NBkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773093627; x=1773698427;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5D58sQUjXLLDfC4Cb+JyinMTeRDp8+6d+A4ebahMYHg=;
        b=ezVsWj+9FpK1+sdRmtsu4NUha3HMh0FeSu5K9KOCwT1oMDULXuTMix29orIblBDt4G
         W0vNF8/XPAowrZao/mcbt/IsWMBQC7yOkoKSiCLCZktwDd+G4VrHBehfDZS1gfFzKqSj
         CFA2msEVifYguNeFV47wPD8sR49G4EhjVx9JKGKZi7so1USGHedKkv4PP/BssQxjnM1P
         Z+MS2L4ZAHWCZRiRyk8xa8nCihRlzUkXCk9tRsDgUX160eTLxJ33gQGg66D54shRIV8B
         e/7G6qNr+v+rXyzkC1G+gHGNQQUhHXd1ebDgUh33rmSt77zd7lR83iZxsiwgO5tA5X32
         /pgQ==
X-Forwarded-Encrypted: i=1; AJvYcCVPmnOaGS/6/m6hyj4zXsb3WDO3hhhL0IdBOPYxJruq/SoS7nfZZDRGVzDk8BX8wyCoML3A1IpB1gHy@vger.kernel.org
X-Gm-Message-State: AOJu0YzaFhZXunpa/5QmcaCmvUr5/p4LdcK+rcQdPieFjGQ6a2qcARFt
	kk5NqLCPslJztRFbxRNHIU+Y/dsHVo/T6fclpJUknbDT+ujxYbO5F0FOHp6qY1LXTmZ47pvmLR4
	cd4YvxFbNO3fbGsQwcL2N5IZb0vX4FpA=
X-Gm-Gg: ATEYQzxhm8+i0uUsoApur61/KjUhAXAqpxaZSig6YBxmVfOPaq8BZZB54sf/wZIpKYS
	HI/cBQaiq8nXPlcvzzDNXAnHUxAhSwfZ/W5ndeMFA64teFJI6cYMq0t6WlimVBHWbencNelw4+R
	D6R5sljbXb6zS8BYekFvYCDj9h6UIoVEHeSQJ+x6X8A7HyeC2EoIhKcR2U91s5evqESrWs1BSDH
	WbZmNyMSbFI3eX+YD2nLZ5MMngatS7xq9n7UmG0Omz2bceHxgFYf9kTB18Fcgvc/xzMCq5sW8it
	F5+t4fk/beFna/2MUMEiZAJxoGCPX0nhhrc80lFig0V4a8FbOpQNgz/DrrlfwwPUHdkWUDFb8cm
	gtM+LOg==
X-Received: by 2002:a17:907:72d3:b0:b94:21a8:f7d9 with SMTP id
 a640c23a62f3a-b942dfb47bbmr716289366b.36.1773093626764; Mon, 09 Mar 2026
 15:00:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260308021535.48098-1-rosenp@gmail.com> <CAD++jLkLj235Q=U_9E-hSneW5E42JjU=dRBJxKJNnqwgBLCm=w@mail.gmail.com>
 <CAKxU2N9JbAzEYfmLpbw5b9Y6MsYUZ1FfLirfy8Hg8MCOUY6PAg@mail.gmail.com> <CAMRc=Me+oUX5xbNY7PX43cTH0e5ouu=Ex3TqhvWvoefmR7jYYQ@mail.gmail.com>
In-Reply-To: <CAMRc=Me+oUX5xbNY7PX43cTH0e5ouu=Ex3TqhvWvoefmR7jYYQ@mail.gmail.com>
From: Rosen Penev <rosenp@gmail.com>
Date: Mon, 9 Mar 2026 15:00:15 -0700
X-Gm-Features: AaiRm501bzkrH4SLjzi0bHRZdX65CXg0f05EKPvilttmHBQT5wJ5o03G2KV3H8Q
Message-ID: <CAKxU2N8_V7U11X18Ja+=tdYPWT6jnmM7bYt+5GHgeXAXOJ5cng@mail.gmail.com>
Subject: Re: [PATCH] gpio: msc313: remove kcalloc
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Linus Walleij <linusw@kernel.org>, linux-gpio@vger.kernel.org, 
	Daniel Palmer <daniel@thingy.jp>, linux-hardening@vger.kernel.org, gustavoars@kernel.org, 
	Romain Perier <romain.perier@gmail.com>, 
	"moderated list:ARM/MStar/Sigmastar Armv7 SoC support" <linux-arm-kernel@lists.infradead.org>, 
	open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 69AD9241FF2
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-32860-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,thingy.jp,gmail.com,lists.infradead.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rosenp@gmail.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[9];
	FREEMAIL_FROM(0.00)[gmail.com];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,mail.gmail.com:mid]
X-Rspamd-Action: no action

On Mon, Mar 9, 2026 at 2:03=E2=80=AFAM Bartosz Golaszewski <brgl@kernel.org=
> wrote:
>
> On Mon, Mar 9, 2026 at 2:27=E2=80=AFAM Rosen Penev <rosenp@gmail.com> wro=
te:
> >
> > On Sun, Mar 8, 2026 at 5:06=E2=80=AFPM Linus Walleij <linusw@kernel.org=
> wrote:
> > >
> > > On Sun, Mar 8, 2026 at 3:15=E2=80=AFAM Rosen Penev <rosenp@gmail.com>=
 wrote:
> > >
> > > > Use a flexible array member to combine kzalloc and kcalloc.
> > > >
> > > > Signed-off-by: Rosen Penev <rosenp@gmail.com>
> > > (...)
> > > >  struct msc313_gpio {
> > > >         void __iomem *base;
> > > >         const struct msc313_gpio_data *gpio_data;
> > >
> > > Do you wanna add:
> > >
> > > const unsigned int saved_size;
> > So in the code there's
> >
> > for (i =3D 0; i < gpio->gpio_data->num; i++)
> >
> > which is equivalent to match->num.
> >
> > __counted_by doesn't support pointers AFAIK.
> > >
>
> This is a regular flexible array of u8. It should work fine with
> __counted_by and I too am in favor of using it as it has become
> standard for flexible arrays.
That requires adding an extra variable in the struct.
>
> Bart

