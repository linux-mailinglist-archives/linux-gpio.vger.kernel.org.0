Return-Path: <linux-gpio+bounces-8290-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7348C937089
	for <lists+linux-gpio@lfdr.de>; Fri, 19 Jul 2024 00:06:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8C3C51C21EFC
	for <lists+linux-gpio@lfdr.de>; Thu, 18 Jul 2024 22:06:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50EC6145FFC;
	Thu, 18 Jul 2024 22:06:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Bxd3ddGs"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com [209.85.219.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE71D1386BF;
	Thu, 18 Jul 2024 22:06:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721340365; cv=none; b=ZvRNnHwNFhYsYlm0/WqNvPyxu27GXxf0idFrmbfp9S6Lb5iT8ZxjaIla7ISDjsmjjlkXnc4HHUDVI8XLkcKNP9VuT3AKf/U/d44qGBos0F7pmkbw9Ox2fC+4C0/Cr5xSUv81QgsWSGNCgiCZq0PY6AnmJenfihW3utq53xQZ6oA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721340365; c=relaxed/simple;
	bh=iVHZRR7THcCgNBSRHwpPAY6JMQ30xKqP1p4FN6RL5B4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=D4/rBO4D/SgiD1Fc2bjgcfUmi2QEMDfkniJG6kMI84actyXqW8/5wrucV8cYejDblm46WxYktrsyakau2pzUjdcio3pIisaMsYfu+ZlS5DFsBxUKzlNeFY9PuiiT2MdIEyqkmHKovjwwDeZH5u2wBENbuptbv5CX8kxGTkc97UU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Bxd3ddGs; arc=none smtp.client-ip=209.85.219.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f169.google.com with SMTP id 3f1490d57ef6-e05ecb3dbf6so1448861276.0;
        Thu, 18 Jul 2024 15:06:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721340362; x=1721945162; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iVHZRR7THcCgNBSRHwpPAY6JMQ30xKqP1p4FN6RL5B4=;
        b=Bxd3ddGs1iCGn+HRc4RPWzxmB2/9WSqMUVQrDt95fiJklNM3KWqDddMj01k5c5sgpA
         pofEy18j9dRYurE+Qk3UaER++1UEI9pVN8Pan4JMtqBLbkqP1JBPYCa6jzG6iwd4N/Cl
         adW3o67f+gtbmBi+5ymYdhx53g5MsK7i1jv2pDVs2kXP7nA0bxYK8mWtRUW+sxz/3xdo
         IaM7P6wk1png1s5sVfunwRE8oZnke7OFWbSdC+BX+BM2QH4NmW8Jwn6WkW+vJ0S4Oijd
         ykwUVX3/IOucBRBtuTwoxSAtTDN7l4ETRYqZbUf/VMOIL/359VvAcbe1zTc/AZ0YgzuS
         uzYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721340362; x=1721945162;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iVHZRR7THcCgNBSRHwpPAY6JMQ30xKqP1p4FN6RL5B4=;
        b=jRroSS8lMb43NRQY1Y+KHZ4QEv4/jEVm0QgPCBNhmyyu//6VwKsrc9SGbKnwSZ0jUy
         kT4OGuOzgpyx4+NPgYDZu0FAsa0bN0YT4Y+YkDdN6M5KnJL9NqiIDi1Ppe8QtewwWAB1
         iQGrePX3bzo+7Gm5cdIKRQyqA1etW1NMFhnNgQOPbNlVl50bsnSTLlUNajn7cY7S8N9R
         Jm9LuMogUW50du6K4FvYweFM35IAhBDYuPUH+Orh7B8UuKuwQlsn4hN+M2aQLX74U5Gu
         L1kvzbarwOOHZeckWRkiEddwy4Qna76nBXbTQ6BTcOEfc/Gy5QzAaZfO+iZidXBR8DFm
         i2rw==
X-Forwarded-Encrypted: i=1; AJvYcCWE7pYWmge2O5FCk6S8IyDOldIGvCHz4JKGtZhxmh5OA9cV7TEpoHc+DbRNkSyBXSERaIxxugGo0ypFfOSMqT5KTB+uBJzOyB/mzWQJjIpLZI+s8+BKmWMU9e0rcAFpRRgdXokP0AxjAA==
X-Gm-Message-State: AOJu0YzcbGuuCJ/UHP43dAssirJaIShgJxYU2oP8zvpWFlYI+pz0QrKW
	XA/Io+ks9ESKozdMu2OoXmtBmQehBVJvzJru8iW1iWeI+DFW7Gp9egG96BgsC/bZV9uVuwVco8t
	OWTuHKNsF6RfDmJLHzx7ZwhWZGMm1lw==
X-Google-Smtp-Source: AGHT+IEDAousrEZ3k6juX9bEYobjR90muGMV5s81+/upBNE7322xB6ctfx2t1AhPz0DRK0RF1UBybn/Avh/wJyco1cQ=
X-Received: by 2002:a05:6902:1b0b:b0:e03:5b8f:89ae with SMTP id
 3f1490d57ef6-e05febe512bmr5381641276.40.1721340362699; Thu, 18 Jul 2024
 15:06:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240711193749.2397471-1-tmaimon77@gmail.com> <20240711193749.2397471-5-tmaimon77@gmail.com>
 <ZpFrslx57m62SEsg@probook> <CAP6Zq1gYSiXFhtA0HAaoSLD7Lz-9nuoy-cUn+qvh0BLev_ifVg@mail.gmail.com>
 <ZpmB5XHvEsiER6Ee@probook>
In-Reply-To: <ZpmB5XHvEsiER6Ee@probook>
From: Tomer Maimon <tmaimon77@gmail.com>
Date: Fri, 19 Jul 2024 01:05:51 +0300
Message-ID: <CAP6Zq1hGyM62Gr0ZZ065O8_jTAouK2_U1NY=guY9bqgcuszgRA@mail.gmail.com>
Subject: Re: [PATCH v1 4/7] pinctrl: nuvoton: npcm8xx: remove unused smb4den
 pin, group, function
To: =?UTF-8?B?Si4gTmV1c2Now6RmZXI=?= <j.neuschaefer@gmx.net>
Cc: linus.walleij@linaro.org, avifishman70@gmail.com, tali.perry1@gmail.com, 
	joel@jms.id.au, venture@google.com, yuenn@google.com, benjaminfair@google.com, 
	linux-gpio@vger.kernel.org, openbmc@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Done in V2 :-)

On Thu, 18 Jul 2024 at 23:58, J. Neusch=C3=A4fer <j.neuschaefer@gmx.net> wr=
ote:
>
> On Tue, Jul 16, 2024 at 05:24:11PM +0300, Tomer Maimon wrote:
> > Hi,
> >
> > It does not exist, do you suggest modifying the "unused" to "not exist"=
?
>
> Yes, that would be clearer in my opinion.
>
> Best regards,
> Jonathan

