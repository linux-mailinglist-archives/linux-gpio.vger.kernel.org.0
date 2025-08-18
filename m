Return-Path: <linux-gpio+bounces-24487-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B3C5FB29D53
	for <lists+linux-gpio@lfdr.de>; Mon, 18 Aug 2025 11:12:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BBFF217AC9C
	for <lists+linux-gpio@lfdr.de>; Mon, 18 Aug 2025 09:11:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3969C30DD36;
	Mon, 18 Aug 2025 09:11:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kl/Antdt"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4854E30DD0F
	for <linux-gpio@vger.kernel.org>; Mon, 18 Aug 2025 09:11:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755508301; cv=none; b=MKFGDhjXI4aZbDAEKjwVQjjw23oVP3ObUq53ublKSqDqMAdQb6Jszh5R/KIuYtGNYZvoAV2OUQSlKs6cbXVk7GWY6YfVwJUI8g0tKeE/bxjszo2bw6w5OtGbIrDNNCMQcndEXabjVgtEJpc92AzPHHwuBZDKdzjW4dYtP4R8y1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755508301; c=relaxed/simple;
	bh=DcnZxDmddaN0uXNCAKklDD8KhKB/8VIRPzW44qoA8sE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uPHBCF0dnO94GHhhTGX/mZE3wI4GQmQtoFSnq4qEY7A9eWlLOsNOUosid6ecYqgJWqZMZjWn48Bz3Uiv+4a2vqqBywKo9ejuGdaGkyXFyMF82jaeUI9u362YMmrOuwPTaZcQBcBwLif6U+AbPAyRGQtelAgQGXFUTi1BNw7Zd5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kl/Antdt; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-55cdfcc0ceaso4428174e87.1
        for <linux-gpio@vger.kernel.org>; Mon, 18 Aug 2025 02:11:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755508295; x=1756113095; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DcnZxDmddaN0uXNCAKklDD8KhKB/8VIRPzW44qoA8sE=;
        b=kl/AntdtMgU91z+uPQbU6HRtx6fU7cQir5rMkQ27rtYBNo7QzCHTgVp2F0ReYokG4/
         aZKoyKxIH7koVD5MI+szpXFBUxHRSjFWLwth1aUFo/ZxE3mx2LmtUbkzHbZq++Hcasfk
         FP1Z/FzMQ6ySFvgBOyDeuMTTL7gcCmAsUbqR5HzrDiyUhZnmncuiSdNCccHRibLHWgCF
         eXFfsf6B26ki2yBfeawCdcoBvFSUD2de60eGIy0fpgGzqVS6bJrDk/YxdS3VqAW3tyH7
         HIzu6ARFkYVM9/3NQdvAJwYgNEUQawe3yZFNOPVIPlZEjZ9YXBhctr2BcHRD9pNu2bhO
         EOdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755508295; x=1756113095;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DcnZxDmddaN0uXNCAKklDD8KhKB/8VIRPzW44qoA8sE=;
        b=hbIPem95Mbr07/eEMbOUkiLfV0rlTKQRIZ7owv8RdFK6mplI2BU0HRRd5KkS7xm4M3
         bZlSS5TeSDyJX2aAJ3MAygWxi/tyZTlZagSo4L/263b2oL7wuXjlM6jt/khq9mjq6UBp
         zR9ZkcMyqwKk21XLOJ3YhOWPAneRQQRkxayNtQSr1zWui49DY/bjWs+1FOG55z5rQir2
         28HtA3Qs+H6PXI1ffCGNKgOVO224vqJ6Ra36pDv6TwgyPZhnnclpq78kjWnPdGQW3dD2
         nVi45Q2Suau03BWc0tgp649i/GGShePZ4/vOEA0b44t0cfROBRKX1VIhCO1ACJqIo9w3
         lBjw==
X-Forwarded-Encrypted: i=1; AJvYcCXbTqmH3HXYrp7naJerUu/hf4Ms1ePlFQjN8d4EwzT4zI1TLOoQMGv99rg7vg85ezWdc7L90NsPlFwP@vger.kernel.org
X-Gm-Message-State: AOJu0YwEvfJg6wSKgows6vFCZSkg1USFHs0uAEUzhSripQnv6EFwmr2K
	ev5/j9g5MLSlgKVktgiMwPL1Ya1LBwONlooZhNLNM/KLicm25yDWlXOEf+X/GFcTGNXf0+K7WOL
	D3gI+OP4S846dMXSoNjjtX6BW26+B9q2ZGIe/fFFunA==
X-Gm-Gg: ASbGnctvOslAe01zKPZ4dicESPkm6SF1IQV2Z2nO023F+s4nXvjl/ol9dYA1wTw1zmy
	bXH04D5R7JrUdi0O7ZdMqcSUEAXdnSZEai5E4fVt+Nt0R050FKcBifRxgQ0Awm1I6Wti5JPh5n8
	IF6JSZyWy9gRWDQ8bH216obeqeXHiCn4HuVChcEhjk26ljBMhY6m0rWZRRIhssjkgjMim97UGaO
	VRbTPZeSt1M
X-Google-Smtp-Source: AGHT+IHgT6KsRzSnbopUtkS8cEhRfVfJ0+AHWqYOh3gWL/IW0zk5pe+bot9eWtYj+gnQIC499kzORbuEnGkUjOVjrWk=
X-Received: by 2002:a05:651c:e0e:b0:32c:be6e:6719 with SMTP id
 38308e7fff4ca-333fac4d04bmr33701811fa.1.1755508295256; Mon, 18 Aug 2025
 02:11:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1755170493.git.legion@kernel.org> <e548b7761302defec15aa2098172eabb1ce1ad4a.1755170493.git.legion@kernel.org>
In-Reply-To: <e548b7761302defec15aa2098172eabb1ce1ad4a.1755170493.git.legion@kernel.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 18 Aug 2025 11:11:24 +0200
X-Gm-Features: Ac12FXxtga8FCHwZMpHGt8XLiCGvlV2q8kZWzSqELDgp5nsspkpj9rrMqCjq2Ao
Message-ID: <CACRpkdZ9oyJ4aJ5Dcp_Dtv5qoiSo+g5cO7Uf4PmHgv_Z423onQ@mail.gmail.com>
Subject: Re: [PATCH v6 5/9] pinctrl: meson: Fix typo in device table macro
To: Alexey Gladkov <legion@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas.schier@linux.dev>, 
	Masahiro Yamada <masahiroy@kernel.org>, Petr Pavlu <petr.pavlu@suse.com>, 
	Luis Chamberlain <mcgrof@kernel.org>, Sami Tolvanen <samitolvanen@google.com>, 
	Daniel Gomez <da.gomez@samsung.com>, linux-kernel@vger.kernel.org, 
	linux-modules@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	Xianwei Zhao <xianwei.zhao@amlogic.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, linux-amlogic@lists.infradead.org, 
	linux-gpio@vger.kernel.org, kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 14, 2025 at 3:08=E2=80=AFPM Alexey Gladkov <legion@kernel.org> =
wrote:

> The typo when using the MODULE_DEVICE_TABLE macro was not noticeable
> because the macro was defined only if the module was built as a separate
> module.
>
> Cc: Xianwei Zhao <xianwei.zhao@amlogic.com>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Neil Armstrong <neil.armstrong@linaro.org>
> Cc: Kevin Hilman <khilman@baylibre.com>
> Cc: linux-amlogic@lists.infradead.org
> Cc: linux-gpio@vger.kernel.org
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202507220009.8HKbNP16-lkp@i=
ntel.com/
> Signed-off-by: Alexey Gladkov <legion@kernel.org>
> Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

This patch 5/9 applied separately to pin control fixes.

Yours,
Linus Walleij

