Return-Path: <linux-gpio+bounces-14506-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BBF1A01537
	for <lists+linux-gpio@lfdr.de>; Sat,  4 Jan 2025 15:21:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E197E7A1FEA
	for <lists+linux-gpio@lfdr.de>; Sat,  4 Jan 2025 14:21:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6983E1B87DE;
	Sat,  4 Jan 2025 14:21:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=posteo.net header.i=@posteo.net header.b="HDTeLqZg"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mout01.posteo.de (mout01.posteo.de [185.67.36.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71BC11474B7
	for <linux-gpio@vger.kernel.org>; Sat,  4 Jan 2025 14:21:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.67.36.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736000478; cv=none; b=PasvnmSGOb4ZizfI1SpjyQRvxoz8DMaSqLCQi1BMsymbAVpRUsOznZIGGgrXZhkpY58sBSdEXuAj8kyeBnOTlVTgWRQHyPyKKCDawxJNDF29de0MMGOorU1MM4P2qDkWjQEhYPmlOzvVrlq+zcvsTpISXr7wgUPREuSSxC3AE5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736000478; c=relaxed/simple;
	bh=a+7OaDpDjSfo5kJZqCF814SYvX9bNZM0msRQs0by9ME=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GRLRijvi8nplW3tMtZC9AQ7oyGSqY0JB3wZGYOAkPtYSUAvdaDhqoI2zO09dkCaqF6nY7t0to30YHW45pWKMzKgku80FIMRvH9c7DWvFSlqtg1OwylnPhfnii5GivvuFYrtsjjPRPJeFrqK9hN0W176yXXlkJck2dVKPBDtk1yk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.net; spf=pass smtp.mailfrom=posteo.net; dkim=pass (2048-bit key) header.d=posteo.net header.i=@posteo.net header.b=HDTeLqZg; arc=none smtp.client-ip=185.67.36.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=posteo.net
Received: from submission (posteo.de [185.67.36.169]) 
	by mout01.posteo.de (Postfix) with ESMTPS id AFAE7240029
	for <linux-gpio@vger.kernel.org>; Sat,  4 Jan 2025 15:21:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.net; s=2017;
	t=1736000467; bh=a+7OaDpDjSfo5kJZqCF814SYvX9bNZM0msRQs0by9ME=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:From;
	b=HDTeLqZg/+VZmgMe/T+GChWXsdv/IeYYnzRwH6HHCI1yQhRjyJbPn0twVkDazu5+S
	 QEj5MhApxKDodtxaJ47KwmpcuINfQbxNxZJ7ffLwpOCzu/DpogvLhaOaaTirsPFotM
	 N/x88VyZ4jCtbCwMAyB5mhiDdPb4r7Zs712IfulON9wrjw6PbkYHKMXc29PIBDtotI
	 BAvvwg4hyelxQSCzAEf/0frcYfPqWZh3Vf+XhzgH7kp2Rm1xMcyrOHSFrG9LIaNQhc
	 mlWLB/QXLkehfwIqk7iGsxGkzYu2GWgmcrJdE3YM2Z6Pq7oSKqhU5li6lPLOUWsUBf
	 +2fK5imSAQp0w==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4YQN0J1Fv7z9rxD;
	Sat,  4 Jan 2025 15:21:04 +0100 (CET)
Date: Sat,  4 Jan 2025 14:21:03 +0000
From: =?utf-8?Q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: j.ne@posteo.net, Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, Frank Li <Frank.Li@nxp.com>,
	linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH 13/19] gpio: mpc8xxx: Add MPC8314 support
Message-ID: <Z3lDz9IucqgGdNR4@probook>
References: <20250102-mpc83xx-v1-0-86f78ba2a7af@posteo.net>
 <20250102-mpc83xx-v1-13-86f78ba2a7af@posteo.net>
 <CACRpkdZVKC9HhUT8LqNnOU5NSE_S-ucuZRWACesEejDWwCyV5w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACRpkdZVKC9HhUT8LqNnOU5NSE_S-ucuZRWACesEejDWwCyV5w@mail.gmail.com>

On Thu, Jan 02, 2025 at 10:38:22PM +0100, Linus Walleij wrote:
> On Thu, Jan 2, 2025 at 7:32 PM J. Neuschäfer via B4 Relay
> <devnull+j.ne.posteo.net@kernel.org> wrote:
> 
> > From: "J. Neuschäfer" <j.ne@posteo.net>
> >
> > GPIO input, output, and interrupts have been tested on a MPC8314E board.
> >
> > Signed-off-by: J. Neuschäfer <j.ne@posteo.net>
> 
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> 
> Can Bartosz simply apply this and the binding patch and get these
> two patches off our tail?

Yes, I think that's a good idea. I'll update my To/Cc list afterwards.


 -- jn

