Return-Path: <linux-gpio+bounces-31907-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uE5QF5F9l2kOzQIAu9opvQ
	(envelope-from <linux-gpio+bounces-31907-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Feb 2026 22:16:01 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id C1D04162B27
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Feb 2026 22:16:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A86C230157ED
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Feb 2026 21:15:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80F0430ACF2;
	Thu, 19 Feb 2026 21:15:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F6conV/A"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42D2E2DC323
	for <linux-gpio@vger.kernel.org>; Thu, 19 Feb 2026 21:15:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771535756; cv=none; b=HPwp0J6DBPqrUk+IcORrWvq0OM4lvNmtG0YNz0W+2aAefdVfxsWkJVdY93RF/zzDL0Z1F176B2zied0RT/XQCxPAIFA4zhiRTiqb2o0E09w+0a3AKlr46rzmFXcuJGIOGozqLnHl+MkvdKVISu6RwRx2IHniRIRZe917/CI+NZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771535756; c=relaxed/simple;
	bh=fC8muMuTMHi3kNVf59Ymbsc4jnwCiylQY6lPtcCbGJU=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YVBaIz5is3lQGX6xOKJmlyOdLo84lau98V0fbcc6ZFVPf9CXRIk5CTgALVhw2aLxfBccO5TikO6Cw39RWHc9CfV0phcWlVDi4/LGOjKiM1+/Yn9glFKXvOSwiJUv/Q0/asbPixFZZTDktaf06lsyFj2EGbad/t8TdyQLRcd5Fh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F6conV/A; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EDC13C2BC86
	for <linux-gpio@vger.kernel.org>; Thu, 19 Feb 2026 21:15:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771535756;
	bh=fC8muMuTMHi3kNVf59Ymbsc4jnwCiylQY6lPtcCbGJU=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc:From;
	b=F6conV/AekvpbmE91058oRBXME6Ajp06duQ+Gy+4Rwx0AJRlOiA1sTHG+3bmvp7TS
	 XLOXU79Dj9kokPkHczT6xFphQsVSamMar5D2KkTihXWlD+tF0sRNzTABpp/zj3w082
	 HpFeh4w+GdSBWf4IFIbTTzdMMP6faBvpXBEZR6fpv47vvFPo14awAIKGfEqFjRG3Kt
	 SFwFZ9RVR6joRPD3/vF2BHSh6kpmMXw6bw/Do6X5fjHnkr0IrmoQ9tmKHgqa8ZD5cz
	 3lQNEPkmPdUdimVXX9Jv2Qbg4/9WNXl9CM/2hch0CpWQwVeLQBoMIJ5pKDgE1HEilX
	 irtDTzfpitmSg==
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-59e4993e00aso1644413e87.3
        for <linux-gpio@vger.kernel.org>; Thu, 19 Feb 2026 13:15:55 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXtchwI4UGPXPSjUZ7av6PYSg10GgOYatG78hsnF7bmcL01nvJvzjhd+iNhMMmrg8sBIIpOvv2YbR8/@vger.kernel.org
X-Gm-Message-State: AOJu0YyNDh5ED0vMLeEsGeHIJ67vfJT5QdipXxg1P5NCzhJ5O9aYyfqK
	zfj8eq0Khf1w2+Myg0V6zg9dK8dp4qwsmpjWb0Jpwj1KVp4ejc6lAJ6aKzwRuinkVsupatOp43J
	vYQU14iQZOD4jvzALoE61SMsaFMYNf9HDU/Jchi8IDg==
X-Received: by 2002:a05:6512:308b:b0:59f:6a34:59d0 with SMTP id
 2adb3069b0e04-59f83b9467amr2128112e87.14.1771535754542; Thu, 19 Feb 2026
 13:15:54 -0800 (PST)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 19 Feb 2026 15:15:53 -0600
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 19 Feb 2026 15:15:53 -0600
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <aZc_P9PcXdlJHqrK@google.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260219-device-match-secondary-fwnode-v1-0-a64e8d4754bc@oss.qualcomm.com>
 <20260219-device-match-secondary-fwnode-v1-1-a64e8d4754bc@oss.qualcomm.com>
 <2026021900-trekker-twenty-9daa@gregkh> <CAMRc=MekX-pXJEs7W9vn8-exAXyfNN3JMwrVNDPXg0b77X1NNw@mail.gmail.com>
 <aZc_P9PcXdlJHqrK@google.com>
Date: Thu, 19 Feb 2026 15:15:53 -0600
X-Gmail-Original-Message-ID: <CAMRc=MewpkVkrr-srOzx0iudwOJyrzeBErbF_-BR-oTo5_KyEg@mail.gmail.com>
X-Gm-Features: AaiRm53KogwDT5sBNDAibERpRw9ZGZulN8JvuYUEQ89mak2vUo-7azt30fNZbJQ
Message-ID: <CAMRc=MewpkVkrr-srOzx0iudwOJyrzeBErbF_-BR-oTo5_KyEg@mail.gmail.com>
Subject: Re: [PATCH 1/2] driver core: provide device_match_fwnode_ext()
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, Linus Walleij <linusw@kernel.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, driver-core@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-31907-lists,linux-gpio=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,mail.gmail.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	DKIM_TRACE(0.00)[kernel.org:+];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-0.997];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: C1D04162B27
X-Rspamd-Action: no action

On Thu, 19 Feb 2026 17:54:24 +0100, Dmitry Torokhov
<dmitry.torokhov@gmail.com> said:
> Hi Bartosz,
>
> On Thu, Feb 19, 2026 at 05:39:47PM +0100, Bartosz Golaszewski wrote:
>> On Thu, Feb 19, 2026 at 5:36=E2=80=AFPM Greg Kroah-Hartman
>> <gregkh@linuxfoundation.org> wrote:
>> >
>> > On Thu, Feb 19, 2026 at 05:31:22PM +0100, Bartosz Golaszewski wrote:
>> > > Provide an extended variant of device_match_fwnode() that also tries=
 to
>> > > match the device's secondary fwnode.
>> > >
>> > > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm=
.com>
>> > > ---
>> > >  drivers/base/core.c        | 14 ++++++++++++++
>> > >  include/linux/device/bus.h |  1 +
>> > >  2 files changed, 15 insertions(+)
>> > >
>> > > diff --git a/drivers/base/core.c b/drivers/base/core.c
>> > > index f599a1384eec90c104601422b04dc2b4c19d4382..bbf1337978fafc35eb94=
bda85e0bb7f6879879c0 100644
>> > > --- a/drivers/base/core.c
>> > > +++ b/drivers/base/core.c
>> > > @@ -5326,6 +5326,20 @@ int device_match_fwnode(struct device *dev, c=
onst void *fwnode)
>> > >  }
>> > >  EXPORT_SYMBOL_GPL(device_match_fwnode);
>> > >
>> > > +int device_match_fwnode_ext(struct device *dev, const void *fwnode)
>> >
>> > No kernel doc to explain what this function does?
>> >
>> > :(
>> >
>>
>> It's not like any of the other variants from this file were documented
>> but ok, I can add it in v2. Still, I'd like to hear if this even makes
>> sense.
>
> I think it really needs a good explanation given how it goes through
> secondaries on one side but not on the other (but maybe it should? Why
> one would not want to match secondary?)
>

I don't think it should. You have one, concrete fwnode and you want to matc=
h
it against a struct device: in this variant both its primary and secondary
nodes. I don't think we should do a four-way matching.

Bart

> I also not fond of the name and still not quite sure if we need a
> special variant or if the normal device_match_fwnode() should be
> adjusted and its callers (there are about 20) should be audited (and
> maybe if the actually rely on current behavior we can introduce
> device_match_primary_fwnode() instead).
>
> And it should be a 'bool' (and we should fix the rest of them as well).
>
> Thanks.
>
> --
> Dmitry
>

