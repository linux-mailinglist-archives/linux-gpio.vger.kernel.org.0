Return-Path: <linux-gpio+bounces-36667-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iN2iEMIKA2pmzwEAu9opvQ
	(envelope-from <linux-gpio+bounces-36667-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 12 May 2026 13:10:58 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1882151F1AE
	for <lists+linux-gpio@lfdr.de>; Tue, 12 May 2026 13:10:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 135393002D0D
	for <lists+linux-gpio@lfdr.de>; Tue, 12 May 2026 11:10:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1CFF53839BB;
	Tue, 12 May 2026 11:10:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K6jFnuGr"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EB533839A9
	for <linux-gpio@vger.kernel.org>; Tue, 12 May 2026 11:10:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778584248; cv=pass; b=XkWZ1rx0nY5KN7E/a8LJ9mtM3iIzigkXx4wHV8V5CK8h9bMzKl4PnicWs5y5RfJmj2B4krY2QFaaiUtKGOie1pdYvKIOuI8jcERioDCARxSEueqAUTFnB+R5/y45RU0KLToKuEsV8FDvWNfloSjWAj408YvVyhaeWSePE09KT60=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778584248; c=relaxed/simple;
	bh=R509GgJQHdK+0hnI8YyvmuJeQo3P8HBd/6X9MujUNy0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=i3wqpePdcHAuZkLzNG05xfIgiSdHRvq21BkVG7Y8sooxdsSiPojNDZgiTCX0HFBjZ6pCcBkHTjJxAISyvKLaUvFIW5Xk1yNRJJNC3mFYLoq4YOIc5qz7SHLlggFOc0cNvcu3APV/qkg+OA+KzxDQ4MUx4Hh7utSnc6EKZ1sGCT8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K6jFnuGr; arc=pass smtp.client-ip=209.85.128.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-7bd4c61765dso58651227b3.3
        for <linux-gpio@vger.kernel.org>; Tue, 12 May 2026 04:10:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778584246; cv=none;
        d=google.com; s=arc-20240605;
        b=cJCTixUE4wbmhSbSeO0mnxvXq7x4cBc/ApkCZdhoWqe/WQDI2HyT0m5dwiycTIqVyS
         7R5NciVhXNfvgB86AWloCBKopHBNMz7RmquTDgcM6d9csqM+hy+wzEwqYXiGCHuEJF3I
         aosw7IQ/m3uj+eDI4XpUxiwpDDN+RpyjeGXpabws+0pR5bz25jk8wR4A4StwTg5Oj+LQ
         jefztnv5QnBSQf4Z+SEMaz2HEUpkFVwLjG8adzypcvcXgs4FbHoJsoM6T9KUFSAg1yqY
         PrsLZo7Hm6UjkC0dZEmNMm8Z9Qcdc8yPSHwk1FWGF/UwxBBXCl3pVv9AaBKpaozvmhFU
         gWAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=O+pKJ+Iqn3Uvr+SlvvrO7l93hbxmujnjKMsO3TefjE0=;
        fh=J9UBeGTN+hKmYfiNdx8N6aa3vXg/5hZshTVPEtqjRPs=;
        b=OBU6AXJW4UexWhA4LfVSGpMXiE/GLFGILr1Ri6gMFV5RnIdLkZwE2ccmfJ36/gxMX0
         n70D6as2eZ74b7GMwqro0VlvmlqyjdnC/ePH3DWWR9K5M+rnxIWQVKtwuL97Rdlmslcg
         hFlnGpGMPJ7pOHq7zbOh/crTRSeIsnFGAovXqH56hg+8Z61Z9mBjUYCk2Q5cXQjiGrCK
         G5ADFvabk/m8xdgIfG4SF37aejNjc9gUZYWsMbhnuKaAUX+o42xgICN6UX+3ljqAY/RA
         yxrmgHXs3hikMbIjPc92Rpif9M62SBO2t5akOAifoX61Qdy5DyUoALnOV/SLJ1//cdw+
         n7+A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778584246; x=1779189046; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O+pKJ+Iqn3Uvr+SlvvrO7l93hbxmujnjKMsO3TefjE0=;
        b=K6jFnuGrtdusrW1OuzVLCJK/ET1IF3NqSVYdpDSd2UnJtQmCSQonjjW9VwPSY4rxWn
         KviCS8+ocwl0SJXFtj4gOJuk4TfTC3aa6mM44+YZZawkpSnpU/SnK37TpM/XaP6gjyCl
         sMbkQu9B594XruCpRuZN9uoCWoy//OhDi1paIirPdQklLcFZS4R4BwtwfviQ4w5yZ5WA
         UQ+2iQ+hYUoRXKUMu+Ryn23If226eBoa3C6SqU0ASFL81J6ulHDREWz1hm6IYNrnE5aI
         YJxkgmec3yoTBv0fR8R/D63TnJaNgiKz92ruWBfywdo16t7ZjO6qPYbX5ShuNc2/FeM3
         euJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778584246; x=1779189046;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=O+pKJ+Iqn3Uvr+SlvvrO7l93hbxmujnjKMsO3TefjE0=;
        b=iricMPl1sP2KH3SpdC6fRsaIXWidysgsNkJBHmtIdaMyw6l+2uZNJK9ijhRNQOsxhD
         SeUgkOoSA04ECveDzyv8xWJroonyrpwjMgNFFo+hykSGFYCLf7SLtqEN+7rKf15CunkV
         qENuzkW8tmNtPICV6QQizNBq8NwB+Fx29VtZx6mdMn99MsFYtelC9px5daITdEYts++k
         3+wEKzgaUtSGps9J1h3qFJ2fmFgRSL6sqLKBJuwaCQx+BRSi+WjIuYsBu0JlQBNhgEtG
         v74R7QyI18bLUSjiF4ubB4qF1dD0wyWLoUgB5tIiXLMYZgmXxlK+emypTBPsa68XIQw0
         SdtA==
X-Gm-Message-State: AOJu0YyeiEb4GnDdD+54/E/FcTlkUEtpSFYMw96LRwR2kVXFtxxOVvNC
	VsvCZOLPrysd39lI9TmcaokyhzdEYk4DhBwcNjw3jo6B8vg+8QRbD8uL3WznX40IPFBc7jO9kjn
	FSUWsf8EJVzrQ0z93CKNXtSQlPL+bO4g=
X-Gm-Gg: Acq92OFoR8n1jy4wtaiZvjbuVZdFGFTB1k4jAH+rEyx1zNurPH2fyCaj4Fa2sF0DVQA
	fgAYQ6r44aFUL2rc8/zQZgH1TRzrgr/8igbFrKZ3cZjZjgZ8u82vwP/vYZqthBpS5ypeffkDayf
	/0P1Ofj9i360JfQ1WrIGeZzxwb+ya43nwICCrlCNq0I9DEB18bir+B9c33FnC0lOL39k0nxNWD2
	9Rt/xzA8Wcp4k4VKMbUD5zetcl0IxmzpwxxVGNzaOJmNYq0Lm/gnzrg4ysL5TDJbSNPpQSsdiE7
	AIsxS365+HoavSvmkTdyEWufuHecA8bmxe8LFBciRUjtvGh4aVWx60N2W3afuYNn54ijd4Dkk10
	mU4tiXMKKeSs+ubR72m3bw30NOLPVqEi0T+cg5NDo3acUq5ieBK8vMEY9Nw==
X-Received: by 2002:a05:690c:6e81:b0:7bd:5cc3:f8e4 with SMTP id
 00721157ae682-7c102d41310mr131723057b3.13.1778584246421; Tue, 12 May 2026
 04:10:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260512073139.16343-1-hardikprakash.official@gmail.com>
 <20260512073139.16343-3-hardikprakash.official@gmail.com> <agMHIhMzS_8AicAI@black.igk.intel.com>
 <CANTFpSX-U5pJ3zQ7NMQMpSu+bw1wB5weW7E-oQ51oE7oZg1cZw@mail.gmail.com>
In-Reply-To: <CANTFpSX-U5pJ3zQ7NMQMpSu+bw1wB5weW7E-oQ51oE7oZg1cZw@mail.gmail.com>
From: Hardik Prakash <hardikprakash.official@gmail.com>
Date: Tue, 12 May 2026 16:40:35 +0530
X-Gm-Features: AVHnY4JzFdAV39wCJmtBkyd9s6za3RvImm4fBhY_MGtRf6DmNeStCURj6cu3plc
Message-ID: <CANTFpSVr0k_nryChHMFDbNmosUf_=+nRaCDn78HsUw=Nr1rhfA@mail.gmail.com>
Subject: Re: [PATCH 2/2] i2c: designware: fix probe ordering for AMD GPIO on
 Lenovo Yoga 7 14AGP11
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org, 
	linus.walleij@linaro.org, wsa@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 1882151F1AE
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-36667-lists,linux-gpio=lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hardikprakashofficial@gmail.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Action: no action

Thanks for taking the time to review, Andy.

To answer your question directly: yes, this patch series was indeed
written with significant AI assistance (Claude, GPT-Codex). I used it
to navigate ACPI analysis, interpret GPIO register diffs, and draft
code I don't yet have the kernel experience to write from scratch. I
performed the investigation, testing, and hardware debugging, but I
want to be transparent about the process.

On the technical points:

1. "Existing?": My bad, the commit message is indeed wrong. The
dw_i2c_amd_gpio_defer_dmi table and dw_i2c_add_amd_gpio_link function
are added by patch 2 and do not pre-exist. I'll fix the commit message
in v2.
2. Fixes tag: Noted. I will use the correct format with a commit hash in v2=
.
3. dw_i2c_hid_uid struct duplicating existing structures: I will take
a look at acpi_dev_get_first_match_dev() and simplify accordingly.
4. device_lock deferral probe: I will add one explaining the race
between driver pointer set and probe completion.
5. device_link_add comment: will add.
6. ":00" suffix hardcoded in the warning: Understood. Will correct this.

I'll send a v2 addressing all of these. Is there anything else you'd
like addressed before I do?

Hardik


On Tue, 12 May 2026 at 16:37, Hardik Prakash
<hardikprakash.official@gmail.com> wrote:
>
> Thanks for taking the time to review, Andy.
>
> To answer your question directly: yes, this patch series was indeed writt=
en with significant AI assistance (Claude, GPT-Codex). I used it to navigat=
e ACPI analysis, interpret GPIO register diffs, and draft code I don't yet =
have the kernel experience to write from scratch. I performed the investiga=
tion, testing, and hardware debugging, but I want to be transparent about t=
he process.
>
> On the technical points:
>
> "Existing?": My bad, the commit message is indeed wrong. The dw_i2c_amd_g=
pio_defer_dmi table and dw_i2c_add_amd_gpio_link function are added by patc=
h 2 and do not pre-exist. I'll fix the commit message in v2.
> Fixes tag: Noted. I will use the correct format with a commit hash in v2.
> dw_i2c_hid_uid struct duplicating existing structures: I will take a look=
 at acpi_dev_get_first_match_dev() and simplify accordingly.
> device_lock deferral probe: I will add one explaining the race between dr=
iver pointer set and probe completion.
> device_link_add comment: will add.
> ":00" suffix hardcoded in the warning: Understood. Will correct this.
>
> I'll send a v2 addressing all of these. Is there anything else you'd like=
 addressed before I do?
>
> Hardik
>
>
>
> On Tue, 12 May 2026 at 16:25, Andy Shevchenko <andriy.shevchenko@intel.co=
m> wrote:
>>
>> On Tue, May 12, 2026 at 01:01:39PM +0530, Hardik Prakash wrote:
>> > The existing dw_i2c_amd_gpio_defer_dmi quirk for Lenovo 83TD checks
>>
>> Existing? Is this message and the whole stuff is somehow AI-assisted?
>>
>> > gpio_dev->driver to determine if the GPIO controller is ready, but
>> > this pointer is set before pinctrl-amd's probe completes, causing
>> > i2c_designware to probe AMDI0010:02 before the GPIO IRQ quirk runs.
>> >
>> > Switch to device_is_bound() under device_lock() to correctly defer
>> > until GPIO probe has fully completed. Also replace the string-based
>> > device lookup with ACPI HID/UID matching for robustness, and add
>> > DMI_BOARD_NAME to the DMI match to reduce false positives.
>>
>> > Fixes: the lost arbitration on AMDI0010:02 at boot on Lenovo 83TD.
>>
>> This is incorrect way of providing a Fixes tag.
>>
>> ...
>>
>> > +struct dw_i2c_hid_uid {
>> > +     const char *hid;
>> > +     u64 uid;
>> > +};
>>
>> Useless as duplicates the existing strictures. See also below.
>>
>> ...
>>
>> > +static int dw_i2c_match_hid_uid(struct device *dev, const void *data)
>> > +{
>> > +     struct acpi_device *adev =3D ACPI_COMPANION(dev);
>> > +     const struct dw_i2c_hid_uid *id =3D data;
>> > +
>> > +     if (!adev)
>> > +             return 0;
>> > +
>> > +     return acpi_dev_hid_uid_match(adev, id->hid, id->uid);
>> > +}
>> > +
>> > +static struct device *dw_i2c_find_platform_hid_uid(const char *hid, u=
64 uid)
>> > +{
>> > +     struct dw_i2c_hid_uid data =3D {
>> > +             .hid =3D hid,
>> > +             .uid =3D uid,
>> > +     };
>> > +
>> > +     return bus_find_device(&platform_bus_type, NULL, &data, dw_i2c_m=
atch_hid_uid);
>> > +}
>> > +
>> > +static bool dw_i2c_needs_amd_gpio_dep(struct device *device)
>> > +{
>> > +     struct acpi_device *adev =3D ACPI_COMPANION(device);
>> > +
>> > +     if (!dmi_check_system(dw_i2c_amd_gpio_defer_dmi))
>> > +             return false;
>> > +     if (!adev)
>> > +             return false;
>> > +
>> > +     return acpi_dev_hid_uid_match(adev, "AMDI0010", 2);
>> > +}
>>
>> The whole flow is just a repetition of acpi_dev_get_first_match_dev().
>>
>> ...
>>
>> > +static int dw_i2c_defer_for_amd_gpio(struct device *device)
>> > +{
>> > +     struct device *gpio_dev;
>> > +
>> > +     if (!dw_i2c_needs_amd_gpio_dep(device))
>> > +             return 0;
>> > +
>> > +     gpio_dev =3D dw_i2c_find_platform_hid_uid("AMDI0030", 0);
>> > +     if (!gpio_dev)
>> > +             return -EPROBE_DEFER;
>> > +
>> > +     device_lock(gpio_dev);
>> > +     if (!device_is_bound(gpio_dev)) {
>> > +             device_unlock(gpio_dev);
>> > +             put_device(gpio_dev);
>> > +             return -EPROBE_DEFER;
>> > +     }
>> > +     device_unlock(gpio_dev);
>>
>> Interesting dance. Needs a comment explaining what's going on here and w=
hy this
>> deferral probe won't be a problem in other scenarios.
>>
>> > +     if (!device_link_add(device, gpio_dev, DL_FLAG_AUTOREMOVE_CONSUM=
ER))
>>
>> This needs a good comment explaining what's going on.
>>
>> > +             dev_warn(device, "failed to add device link to AMDI0030:=
00\n");
>>
>> Why :00? Is it guaranteed that this is going to be with :00? Note, this =
suffix
>> is instance number in Linux and strictly speaking might differ even from=
 boot
>> to boot on the same machine.
>>
>> > +     put_device(gpio_dev);
>> > +     return 0;
>> > +}
>>
>> --
>> With Best Regards,
>> Andy Shevchenko
>>
>>

