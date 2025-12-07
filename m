Return-Path: <linux-gpio+bounces-29350-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A8BCDCAB7D6
	for <lists+linux-gpio@lfdr.de>; Sun, 07 Dec 2025 17:46:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A94A7300529C
	for <lists+linux-gpio@lfdr.de>; Sun,  7 Dec 2025 16:46:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84DB7233136;
	Sun,  7 Dec 2025 16:46:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CBir91JH"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBBEA1C84DC
	for <linux-gpio@vger.kernel.org>; Sun,  7 Dec 2025 16:46:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765125970; cv=none; b=GIRxutWiMGtgUo2MJ80p8sVo6EU9eAl1bj3Q7dTj8brf+lW5bX7SdM3+8fQ1g9KfDhHDoivOICYItoFGUoYv3nZ3ymSzg8upwR1w/lCmZncGx2D1jNyWdWn+1n5aE54hL6tASnq4/jcnM7Li6FRGXGORx3Pn6SMLP7r5BSanZvY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765125970; c=relaxed/simple;
	bh=I9Qx9n4Q79mBOZR4LXGGw10jVvLQ+xkac3lc1hwUVxg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kz8sCGt0ty8XEqZBA3GnJNNQJW0trc/T8SLESR6yRtrPe7p/Gns1oxuhQ2yq4IF37ketJe9yrAmTTaYrzUiFHHjEscCRSSQilwnhPgf8vop/Ao8pX+9IXf+3ANFyf6rvmoDZK/vBGc/xfd/+3ihwyodEdLmg4wJpsBuh7VNkLSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CBir91JH; arc=none smtp.client-ip=209.85.128.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-78a6a7654a4so35167637b3.0
        for <linux-gpio@vger.kernel.org>; Sun, 07 Dec 2025 08:46:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765125965; x=1765730765; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I9Qx9n4Q79mBOZR4LXGGw10jVvLQ+xkac3lc1hwUVxg=;
        b=CBir91JHkBNAEdojL2uT5hVYkK454TrqGILqeUbBA05z9UULrwX+ue7tzZJ1LGxDRK
         sggrLWEpkJvwuFrzzFZd8y9zRg5nJnQ8d4rppNg39LauVtJ11jf5zRU+WXuKKy3xdh+y
         GnOwpOGPhPslsjYOjt5c13M5BpbGBBuEYPS3EqhV7TcPOLfZxCM2F0XtM+btDZQ0Smhy
         S0LgEhFFpAoPkiN7NE9+iyJme0H/QYPfDNx1ziv3lYNDQNMop52xI6ib/PK0VY5+Ztn0
         RnqTAiIOvSiclU4bgeAM+zOgsVchZYeKHtVqXlIXeQQT0b+7DZJ1KhjSuMl2qu7E/o8/
         +Xvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765125965; x=1765730765;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=I9Qx9n4Q79mBOZR4LXGGw10jVvLQ+xkac3lc1hwUVxg=;
        b=ii/Yi37htAUqPatzfYi3d6/vRvlhOmQhSkMbS5lhi3/WRJcYZrOAmSoLf6O4abIdP0
         3yxFL+L4dPF2siM9Uj2baYUDsPGsWvwJhuoOfG1RoYWIiYKkc/CE/towo59cmG88iV7Y
         MqcCI340J6xpy9hCr+P8SIBLbpji3pYJu55zIuTfaXShcikzyurCie76RwoMCOCiVNCL
         RvtAuDXPSvu1ZFU6Td9N1GNcge+/vBXwLUBbuWC1HF2prdwdmRqTdlLeZcLW5uaWtJX/
         dn73RmrI2re5E28eygCemH3DN4FwtB3H9OOGdkV6lE8eJByPiky9ZKTnXQhe1dYojACl
         sOaw==
X-Forwarded-Encrypted: i=1; AJvYcCWv1cAMuFd5ChOPR9GaIupfH8vl6XQD5baM9u6dHL7yPilh2YddFjo5VoJ2Jp89dXNLX52Bqpu5Bf4j@vger.kernel.org
X-Gm-Message-State: AOJu0YzR3z8/LdooriPE8rdEE31gz2vzQ3SwW3li+yV61n4XLihZAuw4
	f+PO4uz2o7BnfXp7lQBhoPGpTM4QV7sMhChKiFtf0CDUEH58WwbfN9hkwDVlOG6s/7oevvuPJcy
	M7YWjhvuq6NmOETNubL3iU9kmEvEJmaM=
X-Gm-Gg: ASbGncsadLepbJYcL6k37PrkyehGlaElmahbredrj9AR4tH096DmX1rOdFwSWPAZkH3
	lfHNzvF8j38hQRceO9ehviNyuJtu4HsAyWkKIduo4wqVtUKBYdhcuRf/3r2zOzEo3obSmZC7exw
	Mns4KaLbQlyiQcQiKII2OKN/HWgRcVb4tX4fdeaAOprN8yZOQGi9fqt9OO3k8nXpTNLKAm5e/dE
	qdO9lc0zfXIUTFAbsqo9rNsigl5T2Lx2XHeLPeee0mbYOrRqEpyVquiZ2arMVA124l7MOmQ
X-Google-Smtp-Source: AGHT+IFojsrwzBu58xmxqNiWONYhG9kxExBjgU7MJi2fTygt5IzjBHutS+yPKMllDxNSv0iDWafdsrpjLRVd2Us7NKw=
X-Received: by 2002:a05:690c:d91:b0:788:bda:47e0 with SMTP id
 00721157ae682-78c33b13875mr51874287b3.1.1765125964673; Sun, 07 Dec 2025
 08:46:04 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <aTLjgEVfLCot0cSm@smile.fi.intel.com> <20251207040459.3581966-1-safinaskar@gmail.com>
 <aTVUakljrd-sysxP@smile.fi.intel.com>
In-Reply-To: <aTVUakljrd-sysxP@smile.fi.intel.com>
From: Askar Safin <safinaskar@gmail.com>
Date: Sun, 7 Dec 2025 19:45:28 +0300
X-Gm-Features: AQt7F2qzPmg7UQ_bISru9-YSQqKjGJESrT0FY3SlqV8KJLp0EpCcDQigL4yk178
Message-ID: <CAPnZJGAxhXNOw1V5FTPK2Mrvu0YAPwm0Ph4UHd2aZv=kgx1qWg@mail.gmail.com>
Subject: Re: [REGRESSION][BISECTED] Dell Precision 7780 wakes up on its own
 from suspend
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Dell.Client.Kernel@dell.com, bartosz.golaszewski@linaro.org, 
	benjamin.tissoires@redhat.com, dmitry.torokhov@gmail.com, 
	linux-acpi@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-i2c@vger.kernel.org, regressions@lists.linux.dev, rrangel@chromium.org, 
	superm1@kernel.org, wse@tuxedocomputers.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Dec 7, 2025 at 1:18=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
> I think nothing. It's better to try to actually fix the non-working scena=
rios
> rather than remove the feature completely.

OK.

> P.S.
> I'm sorry, but why are you so eager to remove something? While in many ca=
ses
> removal of (potentially dead or unused) code is considered a good thing, =
it's
> not always the case.

Removing code is easier than writing new code. :)

Speaking of initrd, I tried to understand Linux init code a long time
ago (out of curiosity),
and so I wanted to remove initrd (to help me understand the code).
Also I saw initrd
deprecation notice back in 2020, and I decided to send a patch for its
removal back then.
But I got time for this only now.

--=20
Askar Safin

