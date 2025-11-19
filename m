Return-Path: <linux-gpio+bounces-28760-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id DB284C6F1BE
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Nov 2025 15:02:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 8A3F33611C3
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Nov 2025 13:55:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A8F2365A12;
	Wed, 19 Nov 2025 13:54:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="caR0wB8a"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70EF6365A01
	for <linux-gpio@vger.kernel.org>; Wed, 19 Nov 2025 13:54:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763560463; cv=none; b=WiONjY6kt8clluXxPSK+IwsJeLe8hCFsH+xxnmmI96WNtInfnj+EjqjvlvMHVW4thQm3HRECn5OycgJjKCD4AZO2JwinAGYZX8OG9QPsBkzU0Zpuh9J0kkkNqamRNNvZpWGcUMKsGm7KvlrJt8zfwTUfUDa+NihAYPtrFmpWx9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763560463; c=relaxed/simple;
	bh=jpzZjBLeT1AD3s4wK65CHjHmlbhTU/QPqa0fnjyk8zI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GTif1+46Hm6Zm03bl3n3iKtrxQRHm732zJZgD277Ib3oAHHb2BBTqd3XCr+KhkT02LNDvJUm2lLO/BIp4bvJrK3fM5IMb7ZLlEs4LuvWUQOkLzdW4T7d6sCgleBluxy4k6Kv3fx3ay3PMT/o0Mrx3dY6IZ3mcHZSd0KJ0H4YNXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=caR0wB8a; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-595825c8eb3so6764220e87.0
        for <linux-gpio@vger.kernel.org>; Wed, 19 Nov 2025 05:54:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763560459; x=1764165259; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jpzZjBLeT1AD3s4wK65CHjHmlbhTU/QPqa0fnjyk8zI=;
        b=caR0wB8aoML1+bRziqB+l1rf/0c+9eVNQ1DWbejFUj1lezUbXqlsOYsE5BmebmZg6X
         Igr6J2M+LkI/25ucIeLEbzxyZ97HKm+ibw/qKe3uo24MFo/B0iWo34QcDptp6209lk6U
         cDM09jlNQ466uKuOCC5Q6Eb9pxieYIUoLJur27fI5L3lrbiX0kIHRWK1NVYp/pSsvNb5
         HI+3ZTVAlex0vcudIrC354JNO2TmT53ZBYH+SOory6fEv9lMtaB44RG6pjmOmCAggxKq
         RqLoU/llVaWPUMKTckuMY4Cth1IqwIbvBOAZtoktruDlligu2jWCser2Ds21Gd6U2Mnc
         r1Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763560459; x=1764165259;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jpzZjBLeT1AD3s4wK65CHjHmlbhTU/QPqa0fnjyk8zI=;
        b=pyEgza2uGPzSyT6vQpvx2weCEy5mxoHQ2bBPBxUb3NZ9mI+99xVv3XDLXNxw+LRevG
         LKqnq9npdE2st9iH+0fSdEROIEv+eNFz6fX+SaBMLcQNXZfodkmZMycDap3kAZUl8B+A
         tVpVihWC8q7jYFSOwpp7vEmx9qy6baI5G+yXhWYLE3EHlbu4PN4gUtA46wyS9JSto2VG
         tH1Sqpiu6IdZDEKz5isbWqdeCRiKRC7UKj4Xje6o3jDUSBHmWEFu9E9BL73XUinA9F8q
         sCzP16n9gesAp3Q4PehkZoo3dijFOmSwJK6eNgUX/rsCoZbtqPgpl9UNdbIosRupEGHO
         08sg==
X-Forwarded-Encrypted: i=1; AJvYcCUXcu3a2QfpMNY3n3mPdhAOI3INqg1fBYyNLeEGQ6lghVFb07pmgN6fcMYHlxRDqdB9wEpv9thrh4en@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1bnOGjbfxuNg1MITkHKS1XrugTD6U0JRYtaDCUDtzmp/7O7b9
	4E3gQkWrkxDhFMqoA3pljwDO0YIM9jY5EB4CzWTgbZkfo/DqZ0ecnQlgXaSf7F12rN+bnTz0pAB
	Gxs370XCA3yYXWYG/fUPzGj8Ze41rL09Z61LL08FFjw==
X-Gm-Gg: ASbGncveljzxchMPCIgcRBxqnOPFJcu0bOfFzWD+R1AEv5veo5+cxK2Nmj3rUJiJqhp
	qhwv6NOl3irTb9bpV1b8pRRLOt/qTumgBKrhKkZpxljpU92cIzJaIgZIZ4VdV1piEJtaESsRDI7
	WF4NTNbITV+xiQJ9uYa8GsSRlJ8deKjAIE2BJXQKcdq/gtwrqhHCp70VL/SURcfWqoG8cw1/D9P
	QIQD7fCSDZcz7xPVkX0x0BxvdOTCObwtv4DeUvDqzedVrm5MzjztqkmGv54MDEgkWyTVIQ=
X-Google-Smtp-Source: AGHT+IESOjqGh16Sg+6VjorDZYFhgIMI/AkAODbCjY+m7ms3fimeF+et7h3zwfnyS7WDTc8dAt126Xe5DriVdPrEAEE=
X-Received: by 2002:a05:6512:104a:b0:592:f2fc:51f0 with SMTP id
 2adb3069b0e04-5958425250fmr7337787e87.30.1763560458449; Wed, 19 Nov 2025
 05:54:18 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251111161817.33310-1-dev-josejavier.rodriguez@duagon.com>
 <80a20b13-7c6a-4483-9741-568424f957ef@kernel.org> <aRslbKpI-aIUip2T@MNI-190>
In-Reply-To: <aRslbKpI-aIUip2T@MNI-190>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 19 Nov 2025 14:54:06 +0100
X-Gm-Features: AWmQ_bm6J5B6u8sk4ORzF_Hjela49fuTuaGVKvTWd0sOCpTYTj03oWY_NVV0RDo
Message-ID: <CACRpkdaA0YqZ6BxUtMVjvXVoR7oM8u6=gRxXAfN4JHPv8NWgtA@mail.gmail.com>
Subject: Re: [PATCH v2] gpio: menz127: add support for 16Z034 and 16Z037 GPIO controllers
To: Jose Javier Rodriguez Barbarin <dev-josejavier.rodriguez@duagon.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, brgl@bgdev.pl, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 17, 2025 at 2:39=E2=80=AFPM Jose Javier Rodriguez Barbarin
<dev-josejavier.rodriguez@duagon.com> wrote:

> I added this new MODULE_ALIAS() because it is the mechanism that previous=
 contributors
> used to enable autoloading of mcb device drivers. After reading your comm=
ent,
> I decided to investigate further how the MODULE_DEVICE_TABLE() macro is u=
sed and processed.
> I discovered that MODULE_DEVICE_TABLE(mcb, ...) was being ignored by the =
kernel build
> system. For this reason, I'm preparing a new patch to add support for MCB=
 devices
> in file2alias.
>
> Therefore, I will send a V3 patch that simply removes these new MODULE_AL=
IAS() entries,
> and another patch to add support for automatically generating module alia=
ses based on
> MODULE_DEVICE_TABLE() instead of MODULE_ALIAS().

Excellent, thanks for doing this!

Yours,
Linus Walleij

