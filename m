Return-Path: <linux-gpio+bounces-9582-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AA1A396884C
	for <lists+linux-gpio@lfdr.de>; Mon,  2 Sep 2024 15:02:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 618101F231DF
	for <lists+linux-gpio@lfdr.de>; Mon,  2 Sep 2024 13:02:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B408C6FD5;
	Mon,  2 Sep 2024 13:02:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="OPoqgt2U"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1B0F19E960
	for <linux-gpio@vger.kernel.org>; Mon,  2 Sep 2024 13:02:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725282137; cv=none; b=f6ILI9TujSphOWkl7kbYEeX54LkmZpLpDBitRi0GN1QeOKgjfBRb30r0nnagFRFpBqfObn6yTR+nKEwC8WRyYB+llnNZK2M3AC0xNT/Dj1MsqrGmfQ8AgmQpGWPcj12Ik0dkxvAd5XXJKmkp+6Kc5+GDEPlh3nmhI38y1Rp3/ZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725282137; c=relaxed/simple;
	bh=GCCz/+hgN4bFM6qcWCJa9mTTDF1JriNper6mrbNBu/0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PIOhG28xiO1z+g+neitefKLaeQ3XqKI7BP7eC5LsoSYaTaM3hzeN8LfHL7CqX0hKINg2sch89zz2juQKlZaN5OmP+VRpRZmHGE0ol0QbaP2CrI2+Ndi1MAbfDRd5QHCNwQYn8qgQXg5T6H2v9PfE1TfucKAeXgFNV9WhkwURO5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=OPoqgt2U; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-534366c194fso3814432e87.0
        for <linux-gpio@vger.kernel.org>; Mon, 02 Sep 2024 06:02:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1725282133; x=1725886933; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3C/PjLZSrrEOmnpe9Vyo2eMd8wib1QehUQG237JMjPw=;
        b=OPoqgt2UXN4eGivudj1Ad9Ut3h9JMnsyElJTiCs7+J/+N4JthHdcrvROQT6rznu78b
         CP36ifHRMzho6oLoMafFIHQD3ASOJGio4T1RKqm/4Xcb/YWxF9ZQNOl3Wsdgjmlpe8S+
         JHJNRJNmKsXaBt0cVi1gxu9pNr8Y2tQCRvbxFbBvDVMqEjVNU32hkHjaiM4cfh2O6e1v
         jrn6MfPHU5KRmup3eyNzC8RTWigm+XmMQv4oIZl4MaozZkkUtm+Kux6sdwY/+dOxVHh5
         1U/LwTzFn8Gd2EXXIeo5N6PVTxnsCWNKbq6uZQanLRLDH6d25K2VablVE46h+RK/Epot
         XSGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725282133; x=1725886933;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3C/PjLZSrrEOmnpe9Vyo2eMd8wib1QehUQG237JMjPw=;
        b=j5DaWWqGI+CrusUIeglVnyrsgG/DkJsiZjhi4lUBXTZ0v3YYgkupO/26JJnTz9eOae
         lg2tQd8/hrPWeYwra2Prs57EHgywIGZcnaJgLjAEffRVtSLcvyxgwIQsAGRdIU+5Ok1D
         H1LDHijgPNSCtwPXMgwPcf2wqv6I/Q4NC6sefQjvEu+Gr+OMNpzK10sun7qfySPn4hqv
         TxGkUIsX/YQhv3TT9pNkViRYvjuT8CVPsG+YdeQc3wJ8vEkegKrElycqBJ65hVR+kJs6
         6+FU5lK+3fN0e9UMPBUoxA4TNfknlTOSglM2M+YEwecX5zQsqGVME8i5oHCt9bI6F7Ww
         ziVA==
X-Gm-Message-State: AOJu0YzqBWcEFjp/dtQ2HaR2Yowaa2eTzm27ZnNZU5Fy1RiA1aq/J7Ks
	bJ75Uu8bs5XqjSfIhr0TjijpeMT2VlLK7tBjaU3kTdlYlulYfuR0JphQUdGDvmi9GzmeJkMzYWO
	IvhyIVcPMCnFNbMuINR0rhJeICZCafCH4Ze+3q8Hfs3D6lvFB
X-Google-Smtp-Source: AGHT+IGkPP32QmOnnqN/wO4JYMvkwbJgK1HcfkWTHSHNsP+HKLmR+8IHSLf8TCFMGLJVOqvkDQ3sdIsar5MOj3baL10=
X-Received: by 2002:a05:6512:1329:b0:533:4817:7280 with SMTP id
 2adb3069b0e04-53546b5a5f5mr8227258e87.35.1725282132925; Mon, 02 Sep 2024
 06:02:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240902115848.904227-1-liaochen4@huawei.com> <172528209370.32205.2474872138444087655.b4-ty@linaro.org>
In-Reply-To: <172528209370.32205.2474872138444087655.b4-ty@linaro.org>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 2 Sep 2024 15:02:01 +0200
Message-ID: <CAMRc=Mca=p0Agz5d8iHJbxZaTfjoXC_qkjPF=xHPO8-o6N7DOQ@mail.gmail.com>
Subject: Re: [PATCH -next] gpio: modepin: Enable module autoloading
To: linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Liao Chen <liaochen4@huawei.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, linus.walleij@linaro.org, 
	michal.simek@amd.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 2, 2024 at 3:01=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl> =
wrote:
>
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
>
> On Mon, 02 Sep 2024 11:58:48 +0000, Liao Chen wrote:
> > Add MODULE_DEVICE_TABLE(), so modules could be properly autoloaded base=
d
> > on the alias from of_device_id table.
> >
> >
>
> Applied, thanks!
>
> [1/1] gpio: modepin: Enable module autoloading
>       commit: a5135526426df5319d5f4bcd15ae57c45a97714b
>
> Best regards,
> --
> Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

I also added the Fixes tag.

Bart

