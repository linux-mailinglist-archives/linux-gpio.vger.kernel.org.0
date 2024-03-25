Return-Path: <linux-gpio+bounces-4599-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id EBE3C889C1C
	for <lists+linux-gpio@lfdr.de>; Mon, 25 Mar 2024 12:11:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 299EA1C33DE2
	for <lists+linux-gpio@lfdr.de>; Mon, 25 Mar 2024 11:11:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19EBC15667D;
	Mon, 25 Mar 2024 06:25:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="V5v6aVgF"
X-Original-To: linux-gpio@vger.kernel.org
Received: from out203-205-221-231.mail.qq.com (out203-205-221-231.mail.qq.com [203.205.221.231])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B45116D331;
	Mon, 25 Mar 2024 02:58:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.205.221.231
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711335491; cv=none; b=TD21ixRKg9/EL7OWfinZ86pX1tCDntJQqAG5/Zcb9PMhk3jK2RsQXbwznP6+F2430/vyaaKLCi9qZeQInuzRRDHzc+yZRBYcWpF1sgW/TXcRYjqMJ4LSMeeoHJNQhlNa5RLdKlyyOtx0namvd6ai+QJM7mx8OqvB9TG5GlYGiOM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711335491; c=relaxed/simple;
	bh=6q3cSj7Dl84jVv87fRaGmOaKhY98faHtxDSaHySMMRs=;
	h=Message-ID:Content-Type:Mime-Version:Subject:From:In-Reply-To:
	 Date:Cc:References:To; b=IQOzb7nvCdu/ck/6kt6GS+h7iyWb4QJlQo9lt+SborbUuReXwpsHKLwtnH3S9BpaVOhERkeYYvFU38w8jUj92gGN5m/3bEj8YeJpjPd3UminvW+pxzNFyLauoTyos8xF/dTe6obaWgJa2wu0/NSQAm4ZrB4b1RT5PW/hNnPP1S0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cyyself.name; spf=none smtp.mailfrom=cyyself.name; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=V5v6aVgF; arc=none smtp.client-ip=203.205.221.231
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cyyself.name
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=cyyself.name
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1711335477; bh=cUaB1Qlwp+5KOdt5XNJfaAEphVdI1Mx9/MaeC4ADKag=;
	h=Subject:From:In-Reply-To:Date:Cc:References:To;
	b=V5v6aVgF4PVWKrv5l409kP6cytZAnuD3qk7Yn045WLcliiOcGeCdKr5G0W5ohjw5+
	 i3WQdOjRvmisBQznRZN/TfKxSmt/f9BhVRReYeigKhu15yTi1EaWKt8spvMXd57NOj
	 1tlnoZr0W4hYMgoiXGsFx1Rrc7zZIASDG04t81Rg=
Received: from smtpclient.apple ([2409:8934:1ed6:2f4f:d8d3:a43a:ef25:fb4f])
	by newxmesmtplogicsvrsza7-0.qq.com (NewEsmtp) with SMTP
	id E73A14B8; Mon, 25 Mar 2024 10:57:51 +0800
X-QQ-mid: xmsmtpt1711335471td1lycwv1
Message-ID: <tencent_3A313D213A8D897C9D8224DA538EAFB8B608@qq.com>
X-QQ-XMAILINFO: MPaKaX623R7Y3L+KntZXBnA7NdwH6aw/GzZNsK/ATSLO+OirAumPXo7IHX44rn
	 GlUXhRU+dDH0hFDeFjSi3zExYsNQYPEXIt3h0AF/6BhT8G3LJe+/aDv/iQYrLFNcouwOA4GDti1k
	 UdzvNNI/tLPLMeSMm+uanZG1bbJ/6b0mnM2qU0PsDg9HMNTZFncfBVc08RD1KFFwfPgmyDV3Oyk6
	 DTm6R1G2abAsPoKxxC6zq1/nKoVL7jeouOgbTZhTzp8GXa18R4V0K0e2ysXfQC05s116LyxZaNJ3
	 whkyJb/t4U/FzCy+Z6wEYcIHslCq0+z9QrH2A3zzpkYAFo/BpGHMZDBz4C6+NJ5qqTyGB3ANrGI8
	 eUisisKnAFldkFUDkJ2v+MIlnd01tGWRnHhPTFkle102pL+TG9axkqPYsF8oQ6ILmkU4790MYqsw
	 9js3tZtkao92myJvumpfht8GhvBdeSLN12iK1rWdkS0wyQVNWXewjJY3DyDIJ/jNFByDFZ69UDfK
	 fDLEcqb/FWUAVjv+DaCpbjq//miDlHRHGe8AvyELIZH3WJN8SZartS0pgofFSm3O8kXJ4Zx1SSrC
	 urDurZLQaTGLfRHqIXDn6/6No9ZOnX7RElYKFqApALD4oIe9mxBtJGe72j7yvq2zXh2Mhaj4PQkH
	 lPQOjFENbVkZYQpDyMOindBn8L3n4e6HqeG7HkGQqZd9X9XkIUn1vUOY7KiyjaLAGBYNB5lL4xep
	 X76coa3VLbA/Vz8Dcpc3h+tbkrDBNH7FHXND1QuCNeVLmAlHo4p8WuVI+NnqTQ/9+gu3Rbs2NfCO
	 3vdaDQpD8AEl7zHBDcJaPcOsYnGSd4IUQw9noVCRojyeqT0faerlyyW+iH++YNx06HGDXhQaTqjj
	 wofz0R6fnvD7D9jFHDo8ZGyZpLX1hlPofnRE1jNMEfeS3DJ1taZ0V6aaANPUNQ8APY/9On6n+0K/
	 BlChnb3z5IOR3kC5wrr62ihCzdnljsagZB4bjkiRZDlcwfGsWZrQ==
X-QQ-XMRINFO: NyFYKkN4Ny6FSmKK/uo/jdU=
Content-Type: text/plain;
	charset=us-ascii
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3774.500.171.1.1\))
Subject: Re: [PATCH v6 10/11] riscv: dts: add initial canmv-k230 and k230-evb
 dts
From: Yangyu Chen <cyy@cyyself.name>
In-Reply-To: <20240325020334.4033-1-dqfext@gmail.com>
Date: Mon, 25 Mar 2024 10:57:40 +0800
Cc: Albert Ou <aou@eecs.berkeley.edu>,
 Conor Dooley <conor@kernel.org>,
 devicetree@vger.kernel.org,
 Damien Le Moal <dlemoal@kernel.org>,
 Guo Ren <guoren@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linus.walleij@linaro.org,
 linux-clk@vger.kernel.org,
 linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org,
 mturquette@baylibre.com,
 p.zabel@pengutronix.de,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Rob Herring <robh+dt@kernel.org>,
 sboyd@kernel.org
Content-Transfer-Encoding: 7bit
X-OQ-MSGID: <ED3A5AAA-6A9F-4DA3-99E8-5F94C542F097@cyyself.name>
References: <tencent_DF5D7CD182AFDA188E0FB80E314A21038D08@qq.com>
 <20240325020334.4033-1-dqfext@gmail.com>
To: Qingfang Deng <dqfext@gmail.com>
X-Mailer: Apple Mail (2.3774.500.171.1.1)

Thanks. I will add them at next revision.

> On Mar 25, 2024, at 10:03, Qingfang Deng <dqfext@gmail.com> wrote:
> 
> Hi Yangyu,
> 
>> - Support for "zicbom" is tested by hand
> 
> C908 also supports zicbop and zicboz. You may add them as well.


