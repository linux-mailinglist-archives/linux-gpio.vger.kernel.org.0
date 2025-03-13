Return-Path: <linux-gpio+bounces-17529-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CC25A5F649
	for <lists+linux-gpio@lfdr.de>; Thu, 13 Mar 2025 14:49:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5C9EF3B8BC8
	for <lists+linux-gpio@lfdr.de>; Thu, 13 Mar 2025 13:49:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C95F267B70;
	Thu, 13 Mar 2025 13:49:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xqZhhW4J"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63733267AEC
	for <linux-gpio@vger.kernel.org>; Thu, 13 Mar 2025 13:49:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741873783; cv=none; b=L8wppXvluVVAsjbshQtq0BKtIZ1OyY2WZpgl2KQaFe+IcjSN07NYz291msChKxc4cMvT6ujr5W9T1JMCwmonVIzSwQzLpaQ2NQqXUQNZf2fHl//y4jyy/RByo1Eps39cmnSL/tevx6403yYXx4QGhpNtfEN3y3XEPjrB5ZHfFLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741873783; c=relaxed/simple;
	bh=s72E+WiRW3VjWXLF2oTp3RR6w8yjtvEkUxbaH/xY8NM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LLg6kgWlkeoirw3+DWqvbfPjo9m0G780vVKohB+ajPRbBkwAfQHOKvVrxzZFwvPHSx0sPKM3+6VW8BiyfIzYyNaSYDjuQixfeFPjEKzwMXCPepHujuLlHxWmUt7QDR9qIvFX2comQydf695UQqpFzozp6olhodM/4/tJBBsZp+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xqZhhW4J; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5499659e669so1093953e87.3
        for <linux-gpio@vger.kernel.org>; Thu, 13 Mar 2025 06:49:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741873778; x=1742478578; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s72E+WiRW3VjWXLF2oTp3RR6w8yjtvEkUxbaH/xY8NM=;
        b=xqZhhW4JohVTUOHFheAsOQtE6SJv9dP80A83z3yd1jtaMdKuDVNoEhT9MdfNGMtAdA
         1WTssz3u7a5UrYp7w2N2sdLhjtvbGX74TfaGOZwolASBdLLaHCmHIWdH/a7RMt4McxHe
         txAzu7R3bxmOiQoC+EHZYfgPa+c06ZzVYPdakDtXRI+PpCgZNppCTzAyC1QoPhruzeLv
         t6Vl0J/aw1LmIxx1TIa6kJTMWmnOzHZVTqR//vBaxrZ5JZ0KDup+VurX5/kBz+yaMhQ8
         Kre8CEWHOknIwbIbq1lR9N2XulpReP14Ymeyy9Bp4N/6azqgxRlekUtrSGymcExZueKq
         3+hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741873778; x=1742478578;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s72E+WiRW3VjWXLF2oTp3RR6w8yjtvEkUxbaH/xY8NM=;
        b=cDR0mkaegB5xlvIGn3JdqiVRGSmkQMSu/iR8nm7YKgoogk2yPsJ7OU6vZ2tozcNv01
         jzLgZMidonPp6R0K5KP8LkPWLoo4wnnt5eiG7VnhxUaQNVNxfbFR6j1T6kq40lMVS3Va
         OLQWmPhM2KmzP4pMIe5Zi1ZfIV5xcs7vP+yKoWdoocDhAMVxEOFPtK3KeDT6kjIMCNRp
         3FiPdT/CiIbUkKaTeHh1jexNbWM7Ih52LbINebufwz+qnPa1qbRCvvUKt25GWGzk2HdJ
         0+2cGUNd9q/d0BsJQBbMFWvDmzrDA+KXpXjZcP+V9kaifASIMaHPkxrxs2jzDpBwvgbn
         MLWw==
X-Forwarded-Encrypted: i=1; AJvYcCWJAmgeIaCo1ouWWE48s5wRr4CX0O9UQpptqNlJ1tAIWkbIzR64TqBYu6ZuMZgk72S0EIGQBwtRsE4d@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7JEMJNkZ90VW3h51wjCc9W3ZUktIgnYlZh+8fk1qKA3OIFQv3
	J5Cs9/smKWaGK0ev2wzIkPPmz3S/YwbKRVF/MBwThn0/aNE5C3Se6C9zWCGgbmFabvNrylCQIJT
	rwBgd0bZapQwDiRby7TVaJNZJBiWhl3GE6aNq8g==
X-Gm-Gg: ASbGncvcDJlqecHfO4kGpys6lD2ANCGmH9zYn6lxiQkdwyQ94X+lGSXY7z0SEc+glZq
	KrMPkG1k2s/xR1zOcLb0KqV54MV/CA67OoR7xcXrddp3LAR6SbcEq8TNZFaLtRfReaSfdmMrnkH
	Zk0eQDA0+34XOz2L8+dFoPG4qRTw==
X-Google-Smtp-Source: AGHT+IEccZO3i5+lVUwnSS/WaACh7JJj5Xo6UXfk6dLNaFoPEkEoI3mENp7/zCsA/uhLA0RMiNFyQBBG0+AbjlILsis=
X-Received: by 2002:a05:6512:304a:b0:545:6ee:8396 with SMTP id
 2adb3069b0e04-549ababc849mr4033095e87.13.1741873778434; Thu, 13 Mar 2025
 06:49:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250306235827.4895-1-andre.przywara@arm.com>
In-Reply-To: <20250306235827.4895-1-andre.przywara@arm.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 13 Mar 2025 14:49:27 +0100
X-Gm-Features: AQ5f1JrLPVPuCTomUP4jXqnxl_0p1ehI2pivoJIVPNCchweDQ93p9WO-dULZ7nM
Message-ID: <CACRpkdaVH8GAx_K0a01FbRKe8CQ=jh7jwfVrs_PgS9og4vnWmQ@mail.gmail.com>
Subject: Re: [PATCH v4 0/8] pinctrl: sunxi: Add Allwinner A523 support
To: Andre Przywara <andre.przywara@arm.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 7, 2025 at 12:58=E2=80=AFAM Andre Przywara <andre.przywara@arm.=
com> wrote:

> this is the fourth drop of the series introducing pinctrl support for the
> Allwinner A523 family of SoCs (comprising A523, A527, T527, H728). [1]
> This time only a small fix, spotted by Jernej, thanks for that. Also
> adding the new tags. Changelog below.

Patches applied!

Yours,
Linus Walleij

