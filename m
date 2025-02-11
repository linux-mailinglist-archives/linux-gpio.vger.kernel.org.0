Return-Path: <linux-gpio+bounces-15735-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BD17A30B9F
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Feb 2025 13:19:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 043E83A36E3
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Feb 2025 12:19:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6FD01FBE92;
	Tue, 11 Feb 2025 12:19:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="XhUBf0gA"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D56B1F3FCB
	for <linux-gpio@vger.kernel.org>; Tue, 11 Feb 2025 12:19:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739276370; cv=none; b=Q3TPrnxjCH8vYIP4KuNOExh30Qa77Ojlsp/nfw1LlyzufsCyevtcT51TMgU3UTIHhyTseZbU+ZgK+nfy+QtzTUMVM78KyKyESBDn1fv8qHtYUp4olnKwx58C5T981Zy0MWoBIY3hpUihvR1TypsfNcH0546P5snoyu4zBEx2tMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739276370; c=relaxed/simple;
	bh=YV+/V9sdNWS897GVPrhzVEvei7oazl3Yldisop72Ywg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WyvjL5851/JaD8rNvqUw9c0+MZh6t7lbY0fehw7Gw3p3oh0MMYovRWLxMZmNiNiaLr+0tEhA7hLFl4PUKEUCA92yGu4aPCk0eztnjJOykWc/ef0IFm3AHKgfTNtoUtVJia1lLvXg+cPUyR1oLSdN/UtDAVxu5YNY2GEjNCvbuxk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=XhUBf0gA; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-543cc81ddebso6083059e87.1
        for <linux-gpio@vger.kernel.org>; Tue, 11 Feb 2025 04:19:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1739276367; x=1739881167; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YV+/V9sdNWS897GVPrhzVEvei7oazl3Yldisop72Ywg=;
        b=XhUBf0gAYuq0bMiugxANzIR9gwgFNmKG1MDdPLIKeE0tJW3XAnkFEA8Srau4I3VkWv
         oLi07RCfVQ0e/Dr8Vva4ysNSOiVOF54folE3aRViOUkcDNfL1c767Qj/j8Blyk2ivHtU
         jaup5MkcL33bTInaGzUlvFjNSxFde+Yg5bBZnwVnmBqS1+vKQZcErX7qtx9SsD2bApsK
         AT3ssE8yR9eLhMG6PB8tPgE8Lnpc7W3az1tT83ZAIP8oXitT59NncLMmiap6hJ0kSqkl
         CFBySd4kV7FgVAMGM68m6Y2PgK+/+h8sQ797xx9seGgn+AS0u+ufQpkDpNApp1MEniYS
         5kHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739276367; x=1739881167;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YV+/V9sdNWS897GVPrhzVEvei7oazl3Yldisop72Ywg=;
        b=O6VXBM+9aqXSCjWpdSJy2SiZLxsYdU/a9VJuOCwgNwTjKj0R17fv5I7R8bm0Dhz5v6
         9aEG9pgdh0YvlyaTvMleKM9tjojTWlG3O0KGW35A0kCoHeQRr1uq3THTIXNWIY3CgSfs
         vdhlVPcAmuLGjnSCTMFKTv3HSJUi6H0L7aR1fIyeXe2Y1+fUXv46NnRngD8PBeMCQTnp
         3+IGUjYaXSJA9sWm3TvpTqnuPOS2lGf/KEKSiu7cauiCmWjaAZ+RsBw8kJ83eO+iNZSt
         r3FP06eg6YR1/mC6OpjlXKCAr70sjCCz5oqqP8KutU6jtgo1nDIjuLwafpMRn8IgcKT9
         6pAw==
X-Forwarded-Encrypted: i=1; AJvYcCVDv7mU4n85Z9yyCAtgqx/yGuHESmb0GaFWcIcJcsweYMVhqoTnG0Ium4y2lhbvigZoZYycdUsca0ok@vger.kernel.org
X-Gm-Message-State: AOJu0YyJletNIhzIDITLbe7YN5vnKw2kV0xt2NW8U3I4Vud/5O9GZX21
	Cut4z6JcbTWqIVcHlTQNM/9NfgNkCeYnU0/lrlYCNdHJWYRCsghk4nZvZ+gtASipQFz/sSccjp1
	by4jijS+EjD4CJd462E9XxdW1BqPZ43VJNFMMiQ==
X-Gm-Gg: ASbGncvPimVtBwq3JMNpbarbV7eDNusoyE3dL9eFPLZIVfj6oxPX2z1/BtE3vWiiAme
	LM492w4Vq/tmHSwnWagQ0/9zCFqyuKVU7y4P86TahOtsRI0tivz3XORgNk/95EF+9pE6PjoOYLI
	EOOpnK+CrOITBGzmgZrJMTj7T8P2o=
X-Google-Smtp-Source: AGHT+IGYxrn8VvG+hmFMeu3O9l0Hxo+atYIUk+qcitHkvE8T3yRM9ImCgH8WPhBQyvK3gRncV71gqSsunU4dJbFSig4=
X-Received: by 2002:a05:6512:b9c:b0:545:8a1:536b with SMTP id
 2adb3069b0e04-54508a1550emr2866169e87.50.1739276367097; Tue, 11 Feb 2025
 04:19:27 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250206-improve-docs-v3-0-2065191fff6f@linaro.org>
 <20250206-improve-docs-v3-11-2065191fff6f@linaro.org> <PH1P110MB1603B27EBC05880518E1E4CD9FF2A@PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM>
In-Reply-To: <PH1P110MB1603B27EBC05880518E1E4CD9FF2A@PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 11 Feb 2025 13:19:16 +0100
X-Gm-Features: AWEUYZmm_Vufcd2VIuYlkpmClZmhEw3INUMAExWV0TP9CODSEgAsAJKq6bFXiM8
Message-ID: <CAMRc=MeFKGdJnru2uwevfQT7XJnLf9GrGvg4b55w-3ybWST6KA@mail.gmail.com>
Subject: Re: [External] - [PATCH libgpiod v3 11/16] doc: provide sphinx docs
 for the core C API and C++ bindings
To: Vincent Fazio <vfazio@xes-inc.com>
Cc: Kent Gibson <warthog618@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, 
	Erik Schilling <erik.schilling@linaro.org>, Phil Howard <phil@gadgetoid.com>, 
	Viresh Kumar <viresh.kumar@linaro.org>, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 10, 2025 at 3:53=E2=80=AFPM Vincent Fazio <vfazio@xes-inc.com> =
wrote:
> >
> > Update configure.ac to check for sphinx-build in addition to doxygen an=
d
> > make the main Makefile trigger a sphinx build on `make doc` (although t=
he
> > docs can also be generated without starting the build system by
> > running: `sphinx-build ./doc/ doc/sphinx-output`).
>
> Should probably be "docs"? sphinx-build ./docs/ docs/sphinx-output
>

Yes, thanks!

Bart

