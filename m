Return-Path: <linux-gpio+bounces-36203-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MJ66DbLp+WmsFAMAu9opvQ
	(envelope-from <linux-gpio+bounces-36203-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 05 May 2026 14:59:30 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 956604CE0F8
	for <lists+linux-gpio@lfdr.de>; Tue, 05 May 2026 14:59:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 105A13035274
	for <lists+linux-gpio@lfdr.de>; Tue,  5 May 2026 12:54:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C9C65385515;
	Tue,  5 May 2026 12:54:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DiuMh/PX"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DC4C23815B
	for <linux-gpio@vger.kernel.org>; Tue,  5 May 2026 12:54:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777985696; cv=none; b=ZqEKOIPtYX9LZZ9TOu71bGgPZaWdmqQKDFav8EmMnKyIt65QwCwGsJXkKF6GuzgUy7iGfHTfNujdL0PsvInNEQILl/tkcvatwBJYRN3GuwY6wQ+k8G7SI87M/OOtDYXDj0LKUOQU/O8zqmKwpyBhvMcl23QIet64ci7Fwi30+x4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777985696; c=relaxed/simple;
	bh=Sh28J4VTj/Gu7tafyIE7Eggfn+Ua5Ea/FbQ2l5rPXB4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BjECTLUw1beDyyVXrOXibsvSknsZhHHsFYFMMEfiuYpP35dYzCKXxuZDOMvW9Jc+LOG0l0aimqPCSZ/tb9sdBUh3KAHatRf8OrSuB5HM1F5GkTY2ByzqMb0hfVdP47V+NGwjnF2Wj4cc0EyNa2s8iwyQbhUTtnZbWAdQBAZAnsk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DiuMh/PX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 733ECC2BCB9
	for <linux-gpio@vger.kernel.org>; Tue,  5 May 2026 12:54:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777985696;
	bh=Sh28J4VTj/Gu7tafyIE7Eggfn+Ua5Ea/FbQ2l5rPXB4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=DiuMh/PX4rQDUL+GxhBPE72jr0WyPeizrZujrEZW8hl5fijkxZwoPkcvbpER5gqF4
	 9ksCEYEWKOGqB3kei7omj1RCAcuwpidRTh/sXQXZ0P7FdbCZguTICdCCnwQINI9ABz
	 q2jXgexKYJtQv40Yd7I97mt97QV3vQpX2FSWeNxKnwqZrWXT5jxl+feg7ElxUnn39z
	 wPJ6Xd48trnC4Q98851hw0Gipbmszn0MYrS1i4ESQAqngLRY2tjaqYYZa9b1vNU5pU
	 Ie125EabuZCIfu+MZ0JSDCQq/1k0vBOabQv5ov/rUgnGoOLebxVWwaWTKj2N+nyVag
	 6JT4LzNNsvbUQ==
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5a4113ab355so4977699e87.1
        for <linux-gpio@vger.kernel.org>; Tue, 05 May 2026 05:54:56 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+PTYqxtTX25DtgzdDquGJuwVuvCz0ug57odKB521UQBoA0C5UOhxcduXlybTuayyZA3kEIQyhvXEVe@vger.kernel.org
X-Gm-Message-State: AOJu0Yws+nXdwxVJIleTOS7M3r2fjmoINB0hVkJ33yxGOUDUklkClMMa
	SM/7lwhUpCMXy7ueqXzb7IH5635RG74xNg6Qb6XKmHX1ZXIXJ40I1aCtTrOmOKltPOxp2ndZqi+
	sARanLEBDwCQq1PnddnxciUI+0id/bXE=
X-Received: by 2002:a05:6512:1093:b0:5a3:fe60:471c with SMTP id
 2adb3069b0e04-5a862fc123emr5138835e87.16.1777985695146; Tue, 05 May 2026
 05:54:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260505093444.61336-2-krzysztof.kozlowski@oss.qualcomm.com>
In-Reply-To: <20260505093444.61336-2-krzysztof.kozlowski@oss.qualcomm.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 5 May 2026 14:54:43 +0200
X-Gmail-Original-Message-ID: <CAD++jLmftqH4dZ-KUuWAy7rCNHv+88rFhaKOgQrsjRVhP8_RqA@mail.gmail.com>
X-Gm-Features: AVHnY4JZvQcynYlsHpntup0LWb0piRJ3MjZc6fGn30J0Ndq_DorGjjph723QHzw
Message-ID: <CAD++jLmftqH4dZ-KUuWAy7rCNHv+88rFhaKOgQrsjRVhP8_RqA@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: qcom: Move MODULE_DEVICE_TABLE next to the table itself
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 956604CE0F8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-36203-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-gpio];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email]

On Tue, May 5, 2026 at 11:34=E2=80=AFAM Krzysztof Kozlowski
<krzysztof.kozlowski@oss.qualcomm.com> wrote:

> By convention MODULE_DEVICE_TABLE() immediately follows the ID table it
> exports, because this is easier to read and verify.  It also makes more
> sense since #ifdef for ACPI or OF could hide both of them.
>
> Some Qualcomm pin controller drivers already have this correctly placed,
> so adjust the other drivers.  No functional impact.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Patch applied.

Some newly merged drivers may be missed, check linux-next.

Yours,
Linus Walleij

