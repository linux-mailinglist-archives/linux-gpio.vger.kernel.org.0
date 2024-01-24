Return-Path: <linux-gpio+bounces-2538-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FED183B37E
	for <lists+linux-gpio@lfdr.de>; Wed, 24 Jan 2024 22:01:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 518E52868AB
	for <lists+linux-gpio@lfdr.de>; Wed, 24 Jan 2024 21:01:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C9151350CF;
	Wed, 24 Jan 2024 21:01:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IEzKOUrW"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6A02811E4
	for <linux-gpio@vger.kernel.org>; Wed, 24 Jan 2024 21:01:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706130063; cv=none; b=nBcatsbpcuWxbvYnmJTlS3Lg1rGyuAkqHfb+63D/BtAzPfy3a64N7zDokAaUCSJllAYU/qUWXWSwYnuCvp31UbzV5VXhCtmK54VUp6yN/vsW7K+mIDPIqKhAEErrdj7StMCdzMdumDoM5xJiwWfF8OYTxZNB30OZF9mU3tnS5J0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706130063; c=relaxed/simple;
	bh=XjQhkWd8iVVS4wfXw50gmxh+Lu18NUGMMaI8CuhqYyc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EdXIjpKhOTnel/LsAMkRKG6or2gUkMDINEXMBx2VnVK/yQ35b/GcLKB9jw3NyX2SHce0/QKipsIA7nS+S4udgh04cc6Fh8HNFs9WaEpK+Qj/z3r9QcjC8tMBeK58w3zUZn1ac62OpkhXB4az5w9BCXrJbqZL5GcywI/v10ibeSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IEzKOUrW; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-55c1ac8d2f2so5054520a12.2
        for <linux-gpio@vger.kernel.org>; Wed, 24 Jan 2024 13:01:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706130060; x=1706734860; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XjQhkWd8iVVS4wfXw50gmxh+Lu18NUGMMaI8CuhqYyc=;
        b=IEzKOUrWMi1p9sCG4V9SrywYjs5KJTgzq8yqx8FWE3zverAnZfeklKjhSyCJUetxgs
         ZONPPJMwje+AvW+Rhj9P3UIoh8+Ol4eu888n/MXfkwh4t3Lt49vAGJ6xas9ypOn36bkk
         iYm5gyebaI+msNxPDuaF70wLia1+UHG0fk7MU2mkkRtzfFp+MxDBM7l/wbiYFL11kwBe
         1RLb/jQxVy1n2p3bABunOiZK1MIiEMlpNiqdLYxSdezX/F4tmpwfbrl1BaF9o5GLSl7k
         E7a1S1bLfEXpOdAm1qHFICL7fKmPjhcM02IJ2+WTV8ygcy4Cd5IQlMx2oxUi1lv8bl/k
         Cfow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706130060; x=1706734860;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XjQhkWd8iVVS4wfXw50gmxh+Lu18NUGMMaI8CuhqYyc=;
        b=Bbg1zU00PrGApGlyp9NB2EjnNato/6nwcd0EE49jeeo1D5FLuqKUPjv0lSxTeVM5Bi
         uyojidtQ7doFyjw0twi6/enIxEUNYVI0Yh849CZifmjv7e61nOt1CVXBQuhSt8KWjg19
         Ulr1c65TD7ZLJnxnQKf80oL/OZX60g1f9Ggq/UDCyClKtb59uC3yISslzPYQiKV9av4P
         ymZJ14XaKTAmAZglKsXwgw+HixFfcYkxjh/5voKlBD0z97MY80bSGCLUJ3uS1Dvmilwh
         MylzsmCGm0t940dpoFuTruZdq516J3wjLwt55cOZkqeyw2ZZjZYMXwA0GuPIth3U0SjT
         Pesg==
X-Gm-Message-State: AOJu0YyxilnwLZ8DswKZA3VUIkGomrbE/TezngGOOjWBgT6P1TNnZdwA
	RMpjgAaFzTtkY8m4XkJa9ZuENsYW0MafZanaoRCr7KX15BQuOKjNxsYRiPz8pnDasrariBfJ5cL
	KLvsAEEE6CXtadQV4I6x5r92IG7ACP/llWAU=
X-Google-Smtp-Source: AGHT+IH3jS9mAYeNVNheSYkbnb3SQ81O2v95jZYfFnNVe9UgwHNXhE7PtU0DXojuekfXYTps3+zQc86jXYN0mv1z9ic=
X-Received: by 2002:a17:906:3c52:b0:a2b:c7ce:8a93 with SMTP id
 i18-20020a1709063c5200b00a2bc7ce8a93mr1155223ejg.4.1706130059743; Wed, 24 Jan
 2024 13:00:59 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240124172438.2086766-1-ckeepax@opensource.cirrus.com> <20240124172438.2086766-2-ckeepax@opensource.cirrus.com>
In-Reply-To: <20240124172438.2086766-2-ckeepax@opensource.cirrus.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 24 Jan 2024 23:00:23 +0200
Message-ID: <CAHp75Ve5LRX+Zm-dKM_aBNf9jznx4h0vGV6xM5CQwYCHcB_Omg@mail.gmail.com>
Subject: Re: [PATCH 2/3] pinctrl: cs42l43: Remove some needless inlines
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: linus.walleij@linaro.org, patches@opensource.cirrus.com, 
	linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 24, 2024 at 7:24=E2=80=AFPM Charles Keepax
<ckeepax@opensource.cirrus.com> wrote:

Commit message?

Otherwise, LGTM,
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

--=20
With Best Regards,
Andy Shevchenko

