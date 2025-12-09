Return-Path: <linux-gpio+bounces-29413-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 86775CB120B
	for <lists+linux-gpio@lfdr.de>; Tue, 09 Dec 2025 22:13:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2A9A03115BD1
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Dec 2025 21:12:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B63F314D1D;
	Tue,  9 Dec 2025 21:06:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Hpfryp4r"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFE42314B95;
	Tue,  9 Dec 2025 21:06:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765314405; cv=none; b=QFEFqF0Q11GeEhf6QcBexxUqlDPx2Oh9GD6HK+6kbs4oNUdNbgEqo4n/5xrzNLuFcYHQjEaDBApxKRCLXmGCvcZPD4M7HyS6CjI+itet2Up8ULFyeHe7yh8u/BmxPhOFjW31LtfTFXdrUazoIHpmStlyTfWs0IuzgwdwYw8KISE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765314405; c=relaxed/simple;
	bh=K7lfH5ZCqJa+nz75ryUq9dUNrsY09Rv7nhuM3sRhrqw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kYvekBtvLmtDmIJRqbd2soHnjeJGUI8/SgkATqt7mWpY9RLnmEphjOViYvu88Fv281qXbpCeZMlyObb+Afl3YSRqY6Ez0g8gYkri92ZTKEafGiq51ahnrezYuZzjz4k7drUTIEOLPEVdj5X+Kzb1NOT+qlN6Wdnd++6t9HgTp4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Hpfryp4r; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13C3BC4CEF5;
	Tue,  9 Dec 2025 21:06:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765314405;
	bh=K7lfH5ZCqJa+nz75ryUq9dUNrsY09Rv7nhuM3sRhrqw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Hpfryp4raHwq13xaTN83E0tYkc1rDnIAo41SWEQdMEjqR+QiYKv+/1PkY8RGMIb7s
	 BonSJhPkDhVrtUL7YKPubNgv90XUYz4X+C4eWkQ/Cr2Y6PneUypdYUu4VoBi3hLTHb
	 fB3YcyeeXlXN2GwXHA8YEEBgxK0qWpgtExH7mBRjv1ZBXgBQ0Ux7ZCdAxX1CWs3HcA
	 5OV/pLTnE6C8N9U3qAfhG7q0gYz6H9YqZOUuWCzPLpcZra3AxRauijDSjJfbf8gtfQ
	 dMtJoQjmnAPaGcoaxyW639GUbFBm5O2Sr4/Mo8p+FoicYu1gSAuEg3N98ReFXZBa28
	 hSki604E/hZWg==
Date: Tue, 9 Dec 2025 15:06:43 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
Cc: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Magnus Damm <magnus.damm@gmail.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	devicetree@vger.kernel.org, Linus Walleij <linusw@kernel.org>
Subject: Re: [PATCH v2 3/8] dt-bindings: pinctrl: renesas,r9a09g077-pinctrl:
 Document GPIO IRQ
Message-ID: <176531440261.1095746.9490643740609832659.robh@kernel.org>
References: <20251205150234.2958140-1-cosmin-gabriel.tanislav.xa@renesas.com>
 <20251205150234.2958140-4-cosmin-gabriel.tanislav.xa@renesas.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251205150234.2958140-4-cosmin-gabriel.tanislav.xa@renesas.com>


On Fri, 05 Dec 2025 17:02:29 +0200, Cosmin Tanislav wrote:
> The Renesas RZ/T2H (R9A09G077) and Renesas RZ/N2H (R9A09G087) SoCs have
> IRQ-capable pins handled by the ICU, which forwards them to the GIC.
> 
> The ICU supports 16 IRQ lines, the pins map to these lines arbitrarily,
> and the mapping is not configurable.
> 
> Document the required properties to handle GPIO IRQ.
> 
> Signed-off-by: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
> ---
> 
> V2:
>  * drop interrupt-controller and #interrupt-cells from required to keep
>    compatibility
> 
>  .../bindings/pinctrl/renesas,r9a09g077-pinctrl.yaml | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


