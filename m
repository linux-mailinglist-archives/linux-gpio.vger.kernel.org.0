Return-Path: <linux-gpio+bounces-12045-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 89A7D9AFAB5
	for <lists+linux-gpio@lfdr.de>; Fri, 25 Oct 2024 09:11:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 496B528154E
	for <lists+linux-gpio@lfdr.de>; Fri, 25 Oct 2024 07:11:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 208751B4C35;
	Fri, 25 Oct 2024 07:11:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oldum-net.20230601.gappssmtp.com header.i=@oldum-net.20230601.gappssmtp.com header.b="IwMlbUTZ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 665411B2EEB
	for <linux-gpio@vger.kernel.org>; Fri, 25 Oct 2024 07:11:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729840297; cv=none; b=sDYuW3VEvCdEXL++9+OIO/brOic+cbfAyhRiOIiwC/dCDuE+/jdKqJFZxmigC/KjDp0P7CPgENBa+qX+abZtYHwOL7uURjvsYMy3dWAeNH0ZOhbTmyHhdwg48uumu+Fy1yeh+MbVKXarIDS/Fz8BvGfpWplqXjtz518w2otul2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729840297; c=relaxed/simple;
	bh=2Yot5CVMrhD1GTtMp0Szbyl+xfW+qQ/vMp2WrwCQU80=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=YJaKlLkOuBn1sgSSZkYdCx8IkgmUoXX3okbdHubJpYbrhp4aTTaL9lL9I+nY+MihQCUsx+PLdi8Kg9gm7v2FiiDLje4Ai/5XQ0hit+Mc6qZu8VAfi0H4p5M6VU3BG2ME68kWXgu6oHrZ8i7tJy0n6OvmnwBa3iXT6RmddQXYx0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=oldum.net; spf=pass smtp.mailfrom=oldum.net; dkim=pass (2048-bit key) header.d=oldum-net.20230601.gappssmtp.com header.i=@oldum-net.20230601.gappssmtp.com header.b=IwMlbUTZ; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=oldum.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oldum.net
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-a9a2209bd7fso215837166b.2
        for <linux-gpio@vger.kernel.org>; Fri, 25 Oct 2024 00:11:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oldum-net.20230601.gappssmtp.com; s=20230601; t=1729840292; x=1730445092; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=2Yot5CVMrhD1GTtMp0Szbyl+xfW+qQ/vMp2WrwCQU80=;
        b=IwMlbUTZwZ2V4lgyH/Q3JZmhuSQBx8rzI9GCTTNjvLGy2h0vZsjxX1Fws8FEjvRUSo
         2/8pkIokWFpMNxu1NBMrO60d76GLvhEd1DdZO4Xi/lNzzyDLSi8hPRA4oMZPcWVYIh9f
         RSHnmNk8wjdKb/vcc6ztEXWzfGuURa+B2L6RzVGtHmUXLVQrQkjGQXnUzUJEQIN+fWyj
         JGvG/BdJMBHskchqRLCsi3YlNOHREcS3tFEn5PBhM5kwOGbm17gn5PAGjKF+WlPCVAAA
         cyYIU/kM9ASp8sGNTlgu6rJL7f4sI2YDThYywtmGsIJ67yUgSH3QOYNKp9hjSeE2tSDX
         OY7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729840292; x=1730445092;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2Yot5CVMrhD1GTtMp0Szbyl+xfW+qQ/vMp2WrwCQU80=;
        b=YgUPUeC4nXFBoDWoTxf9Fzk4x575Rt9bQYO1ErciSLKxlJoCJtwARznmC4pyJsjNuC
         cQEy7GIqum7YtT7WOx99FRN4VkVqj0mn5/SSGgcQ2q4hfhYm1KGc8gmzYjog0yZkXJIc
         kH5qiBGjYfml3rnktK0nqQeJ27T4+QdO7I1EX3O1Io6Jaqfw37BE9MdM3nw9rX/+8Vx+
         hsgM8hVAYSuq80ncxTF08wQg27F4VNBdle+aceo6yps0KSheF0JMUYJNUXJH6SJhSqLn
         gBhbjnnVfjqPqgipBQjcKIc9ig+Au+A7GfEYfNBl/QzgiwpV90gOV7ThhPo9++nzBsSF
         X8DQ==
X-Forwarded-Encrypted: i=1; AJvYcCVN4TwTl83a79P0GfPnYBG22IG9aszdOGPXA8dXUe7hjrn6W65/B97jZSk8Q48w2QgPLmMnw8rx8I9M@vger.kernel.org
X-Gm-Message-State: AOJu0YwR25q/RtkQ4LK7lVXUV35M4tKoSlBsEe+uK7ZTKWazfcYN6Ny3
	8vY0JcMQpVmuvCAiVbwxzEbDxbpdDQWrJG6cQlb5t8KfjhquozZGhRJvcuhioiI=
X-Google-Smtp-Source: AGHT+IGBdf9M+MhMVkkAf67M7SvMWvUIw/h/7r8rJ3Hdx2EtRLd3htedYCpRhV8dD7bWUo1PL92GzA==
X-Received: by 2002:a17:907:3e9f:b0:a9a:bbcc:508c with SMTP id a640c23a62f3a-a9ad2710a64mr438727766b.2.1729840291504;
        Fri, 25 Oct 2024 00:11:31 -0700 (PDT)
Received: from [10.1.0.200] (178-169-191-169.parvomai.ddns.bulsat.com. [178.169.191.169])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-a9b1f0298e7sm35760066b.75.2024.10.25.00.11.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Oct 2024 00:11:31 -0700 (PDT)
Message-ID: <3ace1329d4ef99b87780d0ef07db179d27d04d44.camel@oldum.net>
Subject: Re: [PATCH] Revert "MAINTAINERS: Remove some entries due to various
 compliance requirements."
From: Nikolay Kichukov <nikolay@oldum.net>
To: Mikhail Novosyolov <m.novosyolov@rosalinux.ru>, 
	torvalds@linux-foundation.org
Cc: aospan@netup.ru, conor.dooley@microchip.com, ddrokosov@sberdevices.ru, 
 dmaengine@vger.kernel.org, dushistov@mail.ru, fancer.lancer@gmail.com, 
 geert@linux-m68k.org, gregkh@linuxfoundation.org,
 hoan@os.amperecomputing.com,  ink@jurassic.park.msu.ru, jeffbai@aosc.io,
 kexybiscuit@aosc.io,  linux-alpha@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,  linux-fpga@vger.kernel.org,
 linux-gpio@vger.kernel.org,  linux-hwmon@vger.kernel.org,
 linux-ide@vger.kernel.org,  linux-iio@vger.kernel.org,
 linux-media@vger.kernel.org,  linux-mips@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org,  linux-spi@vger.kernel.org,
 manivannan.sadhasivam@linaro.org, mattst88@gmail.com, 
 netdev@vger.kernel.org, nikita@trvn.ru, ntb@lists.linux.dev, 
 patches@lists.linux.dev, peter@typeblog.net, richard.henderson@linaro.org, 
 s.shtylyov@omp.ru, serjk@netup.ru, shc_work@mail.ru, torvic9@mailbox.org, 
 tsbogend@alpha.franken.de, v.georgiev@metrotek.ru, wangyuli@uniontech.com, 
 wsa+renesas@sang-engineering.com, xeb@mail.ru, rms@gnu.org,
 campaigns@fsf.org
Date: Fri, 25 Oct 2024 10:11:27 +0300
In-Reply-To: <20241024210120.4126-1-m.novosyolov@rosalinux.ru>
References: 
	<CAHk-=wjw0i-95S_3Wgk+rGu0TUs8r1jVyBv0L8qfsz+TJR8XTQ@mail.gmail.com>
	 <20241024210120.4126-1-m.novosyolov@rosalinux.ru>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.2 
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Fri, 2024-10-25 at 00:01 +0300, Mikhail Novosyolov wrote:
> Linus, Greg,
>=20
> First of all thanks to you for taking by far not the most harmful
> actions to achieve what your lawyers very kindly asked you to do.
>=20
> Unfortunately, already a lot of highly qualified people have started
> thinking that you acted very badly. Of course, there are questions
> like why removed maintainers were not properly notified and did not
> receive any additional explanations, but, to my mind, it is useless to
> try to find 100% justice -- it is not possible. Overton windows has
> been opened a bit more.
>=20
> Usually the first contribution is much harder to make then the
> following ones. A big problem here is that now many people even will
> not try to contribute to the Linux kernel and other open source
> projects: their pride for themselves, their homeland, their colleagues
> has been severely hurt (we are ready to fight for all that).
>=20
> It is not clear what to do with this problem. Any ideas?
>=20
> I am sure that people from any country and of any nationality will
> have similar feelings if you act with them or their colleagues in a
> similar way.
>=20
> Thanks to people who were not afraid to say something against this
> action. Chinese, Latin American, African and other people probably
> understand that they may be the next ones to be dropped from
> maintainers. Hope that we will not have to form another Linux kernel
> upstream one day...
>=20
> I am sorry that you have to read a lot of text from people who you
> call trolls -- it is hard to keep calm.
>=20
> You know, you have really made it much harder to motivate people to
> contribute into the kernel. There is such problem among developers of
> hardware that they do not feel comfortable enough to show their code,
> for example because they think that it is not perfect. Let=E2=80=99s take
> Baikal Electronics. They do publish their kernel code, but in a form
> of tarballs without git. They slowly, but constantly worked on
> contributing support of their hardware into the upstream kernel,
> fixing not Baikal-related bugs by the way. One day someone told them
> that =E2=80=9Cwe are not comfortable with accepting your patches=E2=80=9D=
. And they
> stopped their work on upstream. Now that man has been removed from
> maintainers of previously contributed code (code for not Russian
> hardware, by the way).
>=20
> What do I suggest to do? Well, I don=E2=80=99t know, but I do not see dir=
ect
> legal reasons why doing this was required and why patches from Baikal
> could not be accepted (the fact that I do not see does not mean that
> they do not exist, but please show them). Politicians and activists
> can be shown a finger in some places, by both developers and lawyers,
> at least to prevent them from being too ambitious, when they decide to
> break something working next time... But maybe I do not know something
> about truly democratic regimes :-)
>=20
> Thanks for reading.
>=20
Hi folks,

I also do not consider what's happened here as normal. The maintainers
removal stands against the key principles and values of our GNU/Linux
communities and the FOSS ideology. Values and ideas most of us have been
protecting and advocating for since we can remember!

This hurt so badly! Really. This is betrial.

Even if this is now reverted, or the upstream kernel is forked and a new
upstream kernel repository is elected, the history of it will remain and
haunt us all.

Turned out our beloved and "free" as in freedom kernel has been
compromised by compliance to a government.

But this is the Linux kernel, how could this have happened?! It is used,
improved and copied all over the world, not just one country! Why did we
let this happen?

This is a precedent that tells everybody what can come next, due to
"compliance" reasons the kernel could receive code produced by a
government institution that serves not the Linux community, but the
governement.

Surely it is not just me thinking towards what can change so we never
again have to comply to a government of a country when fighting for
freedom!

FSF, any comments on this?

Resist!

+rms and fsf

Thanks,
Nikolay

