Return-Path: <linux-gpio+bounces-37072-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oDEkAL4iC2omDwUAu9opvQ
	(envelope-from <linux-gpio+bounces-37072-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 18 May 2026 16:31:26 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 8281256ED28
	for <lists+linux-gpio@lfdr.de>; Mon, 18 May 2026 16:31:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4158D30471E3
	for <lists+linux-gpio@lfdr.de>; Mon, 18 May 2026 14:24:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4560A48BD4F;
	Mon, 18 May 2026 14:23:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CQPJfBLH"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 067033F58D6
	for <linux-gpio@vger.kernel.org>; Mon, 18 May 2026 14:23:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779114227; cv=pass; b=f6TTMr/yr5QCd4y0Y9dyQ3tXG9Gfpy538ZFU3J/rhpkLkyHt026e70KNW6uHgKHxUPRioHdTfhAh2j8YlPuj8xi2rQM/V2c+M2HVUr+Vm544NdBXTetyUCxORrkr/YpW4zO+TBsiJyc7rLCF6tbnxLZxrq6W4zjzCLMgZRPQq+E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779114227; c=relaxed/simple;
	bh=pRa8rdrYaF2vrezDpKgAG2aDR45R8YIMuW2Emlay42w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=P2sO2aoVdfJ+w4iYa2dpYVzwWqcQOs4HDSb56PKIkaQwTk8WJeWShZ88mYfzmYuBPo+sHseT13dw0a7WiPIQhutrnpxsuKZMtzZcoOEJ4ycjimBV9+qzcX3yVAGnQ2RGoJFrIllODLQOM/Ae5iQ/rI29yZ/DxldIIAbj2tm1Bns=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CQPJfBLH; arc=pass smtp.client-ip=209.85.128.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-7bb0d18c7f9so16272797b3.0
        for <linux-gpio@vger.kernel.org>; Mon, 18 May 2026 07:23:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779114221; cv=none;
        d=google.com; s=arc-20240605;
        b=BxQeEFyTff+ShkZJDOk5AXebCBu6cYboflvQXh/NuxV4HjJWTf8aNpGa+ylmq4CcRM
         z58ErW12n6t93q85+Q86alACaetgSF3093wICkYnKoyBH2Cik2mtNCvqtt1TKUOZDeis
         9aQYLIvmAgxlLSKumvj0ri/9K6RGQ8EP/CU0MwnEQeWZU+ZPO0mk55CpAGMu+geBDVaG
         tniyvKJ7uK06hK2qYA6Vdr1idmzRhQI8uuiRHHNXY1mVprgGyrQwRyJzVGhPyap1x3LM
         +dsDbZq94DTsGGPlfZUpVhtI6AqPMJYzrbRr+4vo2zQgnQSe/KrVBLK9LjzUOCjTKbF0
         03vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=y7z4OfB0gXheG5q1/GRQdWvILLOvJq0pnsazkpZHrUw=;
        fh=29Q4MHELlP6D0lVm33RehLYrehjdqC95bF8i3+9g9AY=;
        b=DNSWGf6D9CAJa6TgOOotMinb9k9cP+nfGY6YK2R41utShb2tvV8o++xSRV+aT2jZTF
         /udybeoaUfaVNKCuKnZI9czkCEYeyumoXMPvQSsF9RC/Vfnot/e4rmp26QTYwEhl6vqG
         E4PO2rrpxfSnfOqPm6YfWVBHshAns9Mw48BUagDgYFScUvItiH/TnFpWEimlwj78WNmv
         edPeZ0pWoppJFgZz56MEIIUyaQvzsF39plN2rjit2UF5NQzXCaI5BpQF/awXwb4XpZXL
         tPWl7dgb4L6nPbB6I5+cMILLY2MsWxa0yZwIMLxz0juqrVbOa49XzzrKKbkjDomyJYWS
         kX8w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779114221; x=1779719021; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y7z4OfB0gXheG5q1/GRQdWvILLOvJq0pnsazkpZHrUw=;
        b=CQPJfBLHXAJjf8TttrV20WUaU39UrSaKmKbHflVKLYTujynjwhiyOaKdoFBZvwXhEh
         iHpfTUwEnb2RlWcIoke3A+JWos/s6sBLDmf7nYEQyoBVMFbL8ivjOH78Fl0dTQjsXXNY
         5Dg2DnWwDBf0WRFdNGqALK0fsNQgBuKA6FpC2zvxzDckvOT56tDkaE7ComedDSFqCEcQ
         4MwKOQoQl8eTYJI8+PEUAltpK1ZS/gSQlq6rKaWwUiuCUz30Jto3beFz6Ug2C5/KMf6r
         3vqa12okvhEEWHpABJfl5dtZl3kFiUFS64JJ0lsQRSRRpZ1IKRFktm4YS1wfpPSJxYhz
         dIiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779114221; x=1779719021;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=y7z4OfB0gXheG5q1/GRQdWvILLOvJq0pnsazkpZHrUw=;
        b=KH+6V4ONxLNxpiKamBypLeBGmapwqRPUGyZqV9dBQ/cuch1/g3PQg0OWL8UTN2rvqu
         3PKmUePmNZyjg/qML4y16FKgxgDS50qFfw6XvPXL44+8dacnJALhvt68zu12lYA0oVJA
         7gech0rphH+DwuMNR9wqsGN+KdqPAeNzL9a9wE24aXxrkfde8olCAXbRFHqLSlwYITxE
         8UHTC6jZeYOTuFi49TuhYjLgtHA9sX9ShnBDiY4so3DHMnNo2ct29koXrTx0jq+f1pCt
         zqU/opOUyJBPFGVKqyC7/yY386OYWU82K8ychQGUjPCDy3qe0gvzAdvYNKxSvcdustBB
         FeEw==
X-Forwarded-Encrypted: i=1; AFNElJ+VCw23WG2HQ8Rf8JhghFNvfwP9o7QOs24TB3gCZk/blDik6NNx1KrFp4E4QimtvAaNJdz+BvyUX89Z@vger.kernel.org
X-Gm-Message-State: AOJu0YxloG4fAUBt9P9cWFdGyni6lwDv6eM2v0m7hfNKvfmSzJGIH+fV
	c2WcRke7+IN30vbiW0qd62dGy6Hq9jdNo3+YHS7RSrwK/rwWoLOo6HpIetBps+RBWc3MRKEbHm1
	t7UU+9s2mVmH7d79MGzyyx6rIcCm7/uc=
X-Gm-Gg: Acq92OFyBPaiAAzQYQNRf6WBGK59liPe8vMrIDVSmjISs7nPar/StfnQEua6f+hBSsh
	AtM5GjRwLQNvzk9tZjUNUxS9LdVQHsOt97oUjNVbPjvWnZIGrnnW+O3WiVmW6YRJ4FXAdXz4Zfa
	RSbv6KJ/H3OtB4JqocLKOBA9a14kWrUaZ6vz3DNFtJ1hfO/rpxw04fJBsv5hodXFLYQqJzzmT7B
	ZN5PvpvHzZHjwda4xV21xlQzuoynLxfQMNgSfgCVXzzV86WVfkO6AAUn39RgetDH52bZcYlDT8k
	Jt21J6r6LL/6i9ftU5dpLPrQAztV+aNlE/G6QOxhm0IDJ38ks/e6LHgM3TX5Jri7vLipaHST42L
	aYvPlxF6MKeoTdd9TPFsJ8gb8rfgBQTqtywlhR3o4EJ1G/wKhZzPAs3bpIXA=
X-Received: by 2002:a05:690c:f08:b0:7bd:9899:f906 with SMTP id
 00721157ae682-7c958eca6a4mr171352837b3.7.1779114220494; Mon, 18 May 2026
 07:23:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260518122814.8975-1-hardikprakash.official@gmail.com>
 <d57dd297-6be1-43a9-a38d-e40c8949e23a@amd.com> <CANTFpSWGC7GsAY-3UvPtBZzqjNek-T5haiDb59QYRoRgwuQf1w@mail.gmail.com>
 <7d0f0cf9-1936-4cf6-a425-228a37f83137@amd.com> <CAMRc=MdS_BVKb=FQLhky=8dpghBSoHeBhUk0LM5hROFxmJeyGQ@mail.gmail.com>
 <9d5da93e-bbe0-4359-9f17-e3c6b3a5cb34@amd.com> <CAMRc=MfT_WVMxPnYZW=mg52PHew0O4VQMGFrfo6G9vxZDDoArw@mail.gmail.com>
In-Reply-To: <CAMRc=MfT_WVMxPnYZW=mg52PHew0O4VQMGFrfo6G9vxZDDoArw@mail.gmail.com>
From: Hardik Prakash <hardikprakash.official@gmail.com>
Date: Mon, 18 May 2026 19:53:28 +0530
X-Gm-Features: AVHnY4Ig35hP0cTA_r9SZS40mbG-rzLU3zT8q7iMy-UtxbbZdOTsMqBJJ1iVRcU
Message-ID: <CANTFpSUX5rYhuTQH3dTTvzW+_yhW8Gs0U=A1t_8LDzKz4dzzAw@mail.gmail.com>
Subject: Re: [PATCH v5 0/1] i2c: designware: fix probe ordering for AMD GPIO
 on Lenovo Yoga 7 14AGP11
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Mario Limonciello <mario.limonciello@amd.com>, linux-i2c@vger.kernel.org, 
	linux-gpio@vger.kernel.org, wsa@kernel.org, andriy.shevchenko@intel.com, 
	basavaraj.natikar@amd.com, linus.walleij@linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37072-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	MISSING_XM_UA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hardikprakashofficial@gmail.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 8281256ED28
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, May 18, 2026 at 19:35, Bartosz Golaszewski wrote:
> What is blocking the pinctrl driver from probing? Does it return
> -EPROBE_DEFER for some reason? Pin control core is ready at
> core_initcall() so it should work in theory.

On Mon, May 18, 2026 at 19:16, Mario Limonciello wrote:
> Please try arch_initcall instead.

Tested arch_initcall + patch 1. GPIO 157 now fires at 0.255s (earlier
than any previous boot), but arbitration errors still occur at 2.309s:

  subsys_initcall + patch 1:   GPIO 157 at ~0.310s, arbitration errors
  arch_initcall + patch 1:     GPIO 157 at ~0.255s, arbitration errors
  patch 1 + patch 2 (v5):     no arbitration errors, touchscreen works

The driver is not returning -EPROBE_DEFER. The problem is that
amd_gpio_probe() hasn't completed by the time i2c_designware fires,
even with arch_initcall. Promoting the initcall level gets the driver
registered earlier, but probe itself takes time, and i2c_designware
catches it mid-probe regardless of registration timing.

This is why device_is_bound() works where initcall promotion does not
=E2=80=94 it waits for probe completion, not just driver registration.

Thanks,
Hardik

On Mon, 18 May 2026 at 19:41, Bartosz Golaszewski <brgl@kernel.org> wrote:
>
> On Mon, May 18, 2026 at 4:08=E2=80=AFPM Mario Limonciello
> <mario.limonciello@amd.com> wrote:
> >
> >
> >
> > On 5/18/26 09:05, Bartosz Golaszewski wrote:
> > > On Mon, May 18, 2026 at 3:46=E2=80=AFPM Mario Limonciello
> > > <mario.limonciello@amd.com> wrote:
> > >>
> > >>
> > >>
> > >> On 5/18/26 08:40, Hardik Prakash wrote:
> > >>> On Mon, May 18, 2026 at 18:17, Mario Limonciello wrote:
> > >>>> I'd still like to avoid a quirk if we can.
> > >>>>
> > >>>> I know my proposed patch to try to probe at an earlier stage didn'=
t
> > >>>> work, but could you perhaps try pulling pinctrl-amd even earlier?
> > >>>>
> > >>>> Maybe fs_initcall()?
> > >>>
> > >>> Tested. fs_initcall + patch 1 still produces the same arbitration
> > >>> errors:
> > >>>
> > >>>     subsys_initcall + patch 1:   arbitration errors persist
> > >>>     fs_initcall + patch 1:       arbitration errors persist
> > >>>     patch 1 + patch 2 (v5):     clean boot, touchscreen fully funct=
ional
> > >>>
> > >>> The initcall level does not appear to be the determining factor on
> > >>> this hardware. i2c_designware is still probing AMDI0010:02 before
> > >>> pinctrl-amd finishes regardless of how early pinctrl-amd registers.
> > >>> The explicit device_is_bound() deferral in patch 2 is the only
> > >>> approach that has worked.
> > >>
> > >> Please try arch_initcall instead.
> > >>
> > >
> > > What is blocking the pinctrl driver from probing? Does it return
> > > -EPROBE_DEFER for some reason? Pin control core is ready at
> > > core_initcall() so it should work in theory.
> > >
> > > Bart
> >
> > Currently it's module_platform_driver() IE device_initcall().
> >
> > That's why I think we "should" be able to move it a lot earlier.
>
> I mean with fs_initcall() change - what's blocking it now?
>
> Bart

