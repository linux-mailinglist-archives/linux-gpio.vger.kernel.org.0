Return-Path: <linux-gpio+bounces-30305-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 31454D06E30
	for <lists+linux-gpio@lfdr.de>; Fri, 09 Jan 2026 03:52:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2A08D301B2EB
	for <lists+linux-gpio@lfdr.de>; Fri,  9 Jan 2026 02:52:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5BD1A319617;
	Fri,  9 Jan 2026 02:52:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=thingy.jp header.i=@thingy.jp header.b="lXKB6bZR"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5939F2BB13
	for <linux-gpio@vger.kernel.org>; Fri,  9 Jan 2026 02:52:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767927126; cv=none; b=FhlNfI6b0DXWaoW3bF21A0NflOIg8PW4SozJF16Ex2A6ZdeDLWTIixmZJHPlso3UgkDkBWVHne1PVyDd2mYG9L9On3qoZkve7ZGSjpOpjaJqLuPI9Fb+0+sZLKPXo4UAlhsvBtw2UvMexOwWR+z86H5DpZjo2oY5y033FKHT7JE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767927126; c=relaxed/simple;
	bh=mGiZtSDJ7qSg96MVzhLpALvztIeG3xTQS4GuW7PemHI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Te/RF1gtPATLVMP8pheaMDKaSMFyqCm7BuI8oPhrWOX92IgJ0grZKONLaWhOf7xiZ7CXmO9lvx7m8Dm8pwuS3YZYtITcwiBvNQcgl/EA7ExuG8o5eP1vO4xdw4zCxKvBhElQHKf0zFplo4Rs+VAcviaxtDI+aWlzZXX+mOs2nBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thingy.jp; spf=pass smtp.mailfrom=0x0f.com; dkim=pass (1024-bit key) header.d=thingy.jp header.i=@thingy.jp header.b=lXKB6bZR; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thingy.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=0x0f.com
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-bc17d39ccd2so1687928a12.3
        for <linux-gpio@vger.kernel.org>; Thu, 08 Jan 2026 18:52:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thingy.jp; s=google; t=1767927123; x=1768531923; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=mGiZtSDJ7qSg96MVzhLpALvztIeG3xTQS4GuW7PemHI=;
        b=lXKB6bZR+ZI2Bi7HWtKhYdPRC7DhAVKT35FmuqS6b9HTKD+DZaPpPwYQyMj5nmddpz
         r/LwWYz+ukQ7Nh3YRAznrg1iZz3w8GgP1CeVkXd/czEEzBXxuQ26T/4CLdQyhJkp8UQT
         Qpa+9t9A+WDUELhAVXePGRjba1UqBkNADSwcA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767927123; x=1768531923;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mGiZtSDJ7qSg96MVzhLpALvztIeG3xTQS4GuW7PemHI=;
        b=O8LVFEYgL/v0VmCHfLHyRaYogb+/IDuyrdVdtfx+2lrtKj0c7D1AmWZpEJxgKKU09I
         NKJu7u5vhOcl7foAJD46IJ67chP7m/oZouwTazLpLQ+yW+PktAYerRtbDBoL2q24v3IG
         ebb/VblnxDODnmq5Nrb2WP/V4ZeyzqWT6qE1i3aEdGNIIKB+3wwGSeozt/qvaP2YhWSS
         scqohgVo6S3kKxgf7DLFKlnanP9Vh7KZZOu+Ri69iSSZbeR46Mo//ioFR7Tij9h6xSLM
         rpjpjCHWR0rE6AkF5lJA1B2Te7Sb40vxVowz1Nr0e9VQsga849I2W7tyRIx+XDDDq5bz
         7o+g==
X-Forwarded-Encrypted: i=1; AJvYcCVKJboLwmWebji+B8YNvUQl/rT16l+DqunLL94dVmFRD0Go7NUjrP8coocRh5TIt01BWBxKv4soCqKq@vger.kernel.org
X-Gm-Message-State: AOJu0YzJAlGWPmYI5sTTMbs2e1HFMIJMPDhBZdUajLXAb26mbAvRndVL
	NeQa4k1fGiiiieH/nGWO4Dcp//ZoyXwmKwP6lC+8h8kUiSTrRYlHUhLFF+7Zfm2OEMCvhsDIPvl
	xvBO3e/LcljaltXZMZU76iIE3iHU5EFlQQ1DArKQpTw==
X-Gm-Gg: AY/fxX5R6dm+pzruAXG3GUZI3fAxenr2lzY31VJhGOq5r1lZQlpPX299qdukXIoPav6
	FODqTNwGMS8mjl9UecAYYTdNNNsdEFC3RwXk7N3PH0aX53LKvvbmdLw0tIe+3riY7Z9338FEt3V
	QxzQnUOtsvJpQsfUgeqdkFAX0Cbh7Be2QW9T7543GuiBlBWafW7Hw++bcaPu6FmgAPV1CYaiHCz
	+BZfpbC9CJjzWPc/SOA4BOYoY6VYOrx/QIHgGJjJlKkGv0T+oSRk8QwkRrFMcGoLRnZxZtc
X-Google-Smtp-Source: AGHT+IGNd3sXlGKj32ScGdjnaH7fI+mBGLRjR7fUrxGMIyJ8kaC+ObQl8ETSG4eHd1JmTvkwvmX6Fi+GVVxjc1gw0uY=
X-Received: by 2002:a17:90b:5867:b0:32e:e18a:3691 with SMTP id
 98e67ed59e1d1-34f68c47f70mr7963900a91.35.1767927123587; Thu, 08 Jan 2026
 18:52:03 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260107030731.1838823-1-daniel@thingy.jp> <20260107030731.1838823-2-daniel@thingy.jp>
 <20260108233818.GA1466897-robh@kernel.org>
In-Reply-To: <20260108233818.GA1466897-robh@kernel.org>
From: Daniel Palmer <daniel@thingy.jp>
Date: Fri, 9 Jan 2026 11:51:52 +0900
X-Gm-Features: AQt7F2orPoAVfGwBrHQpNsAjLASeWiXftaT5m8q7f7B1C1FL71Cp6WZRbeaE2xE
Message-ID: <CAFr9PXn2HzkSRnX4X-X1q2U+zLxwSP=TxvRwmA5eYxad7SbLzw@mail.gmail.com>
Subject: Re: [RFC PATCH 1/2] of: Add a variant of of_device_is_compatible()
 that can be build time culled
To: Rob Herring <robh@kernel.org>
Cc: linusw@kernel.org, brgl@kernel.org, saravanak@kernel.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Rob,

On Fri, 9 Jan 2026 at 08:38, Rob Herring <robh@kernel.org> wrote:
>
> On Wed, Jan 07, 2026 at 12:07:30PM +0900, Daniel Palmer wrote:
> > In a lot of places we are using of_device_is_compatible() to check for quirks
>
> I'm assuming 'a lot' is not just 3 places? Got a rough estimate?
>
> This seems fine to me assuming there are more.

In core code (like the gpio core, and not in a specific driver) there
are only a few places. I think around 10.
There are more when we get into drivers that handle lots of variants
of the same hardware and check the compatible string during probe.
(There are ~700 calls to of_device_is_compatible() in drivers/, most
of which seems to be quirks checking during probe).

Since this didn't get shot down I'll prepare a version that has more examples.

Thanks,

Daniel

