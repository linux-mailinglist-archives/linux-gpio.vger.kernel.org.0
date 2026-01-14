Return-Path: <linux-gpio+bounces-30551-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F614D1F3EA
	for <lists+linux-gpio@lfdr.de>; Wed, 14 Jan 2026 14:58:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D1B22302AF8E
	for <lists+linux-gpio@lfdr.de>; Wed, 14 Jan 2026 13:54:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19656276028;
	Wed, 14 Jan 2026 13:54:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cvxhmlDB"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFE9E272813
	for <linux-gpio@vger.kernel.org>; Wed, 14 Jan 2026 13:54:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768398870; cv=none; b=C6Y028Six396e34IwpAX86c6UYZVP0S6Nz0IEEq2vpHnZ5O5aFkrbLxKTz8+XYB76y8+aVw+zBvTOULjzaPeLilhqDq8OwXxRptQRbVGYsiaB4EBQQKnHFH7+GZ9q8yoTIY7/4rJa5pGbNeNxF0inkAMMDkJcbWLLq+DbqP1hFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768398870; c=relaxed/simple;
	bh=pko9oW1g+IluAhY7M1qdOiwhwRkDyq9ZjyBhU9sgrLY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=idX3lnBT1YDamKFJbl4RSSQSDmi0OyQxf0SeUnqLgghmla1k1bhHxiKMZrz9j/7nSzze3ZlkgqtBOkRhBB4pbk1m07kSHQcInW87tyTlqJTFYqpOzvi0mcy/KQZaRgJH8wbly0I6+1epnmM7SG8teKxxOkZLKv+saf9M9GwsD7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cvxhmlDB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81AB5C2BC86
	for <linux-gpio@vger.kernel.org>; Wed, 14 Jan 2026 13:54:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768398870;
	bh=pko9oW1g+IluAhY7M1qdOiwhwRkDyq9ZjyBhU9sgrLY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=cvxhmlDBIWz66KMgGJkZsiNg/kcCqFr1SH2ajz4Bvlp3FXF1JN9gkfEwuB94fgep1
	 KS5DH+zPbowY5TrkhD/Zt5J/WdDPj7dWOv2cn/iyNDzs5idHyyp5AL02jAw5vU90wa
	 Zv65yzYpKrdbVxK4cH3wJMcTIwAN88JY1bVrc5DyBMDw4syzWnhgJj7hObOk/jj9KM
	 Dis0MQ7Wvhq5uQeNhfxgCSPCc3lUtg4hOBovQxeRBnMSdsJtfWm5grYPKc0WXD27Xv
	 JmI7oGwHohvMSsppF/ppe1Xa0s7eSDHVlSCWWCymp53g0mCrR+7QSKuXVpQeNKhDkO
	 Di5lkP5NfUR2Q==
Received: by mail-yx1-f41.google.com with SMTP id 956f58d0204a3-6467ac59e16so6328465d50.1
        for <linux-gpio@vger.kernel.org>; Wed, 14 Jan 2026 05:54:30 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUOxv+8WfHEF7fZ9DtHSJZX4SD31jzWfUv9yryUUDLV6H3/KPvHoJfxE9tMlWpoIqwh12fFViw+XCi1@vger.kernel.org
X-Gm-Message-State: AOJu0YxnCra6bGRNeCbJ29zrBdFpf518YM6qB/MzcQibJAQTxvBdgKCa
	ThxX1D6iiFXlHnR1J9Hi8nCqpch0LWXT8CCztKzEdb3aJEyxlcvT1+oze5uRmZVzZydXysme2q+
	pVyb0qhvhk33CalEKrJgr94Vu5blkJQo=
X-Received: by 2002:a53:ac8b:0:b0:646:5019:f3f2 with SMTP id
 956f58d0204a3-64901a9c702mr2454045d50.19.1768398869885; Wed, 14 Jan 2026
 05:54:29 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260114-k3-pinctrl-io-doc-fix-v2-1-025b05f9e65a@gentoo.org>
In-Reply-To: <20260114-k3-pinctrl-io-doc-fix-v2-1-025b05f9e65a@gentoo.org>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 14 Jan 2026 14:54:17 +0100
X-Gmail-Original-Message-ID: <CAD++jLk-dg1Hh28QaTo+0nONAP1PiOQza1-L3Nn4XJEeEShmuw@mail.gmail.com>
X-Gm-Features: AZwV_QgO7G4JdjPod5hP416XqHCDN-684za1JJpJPBU8JnvDVeq9VXheBatx4Aw
Message-ID: <CAD++jLk-dg1Hh28QaTo+0nONAP1PiOQza1-L3Nn4XJEeEShmuw@mail.gmail.com>
Subject: Re: [PATCH v2] dt-bindings: pinctrl: spacemit: k3: fix drive-strength doc
To: Yixun Lan <dlan@gentoo.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Guodong Xu <guodong@riscstar.com>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 14, 2026 at 1:17=E2=80=AFAM Yixun Lan <dlan@gentoo.org> wrote:

> Fix a typo in DT documentation, it should describe the 3.3V drive strengt=
h
> table of SpacemiT k3 SoC.
>
> Fixes: 5adaa1a8c088 ("dt-bindings: pinctrl: spacemit: add K3 SoC support"=
)
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Yixun Lan <dlan@gentoo.org>

Patch applied.

Yours,
Linus Walleij

