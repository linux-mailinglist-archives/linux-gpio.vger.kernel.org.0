Return-Path: <linux-gpio+bounces-27333-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BED4BF45DF
	for <lists+linux-gpio@lfdr.de>; Tue, 21 Oct 2025 04:18:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 9019E4E4C98
	for <lists+linux-gpio@lfdr.de>; Tue, 21 Oct 2025 02:18:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 816D0271451;
	Tue, 21 Oct 2025 02:18:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Pbm/pwjf"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33F6B4AEE2;
	Tue, 21 Oct 2025 02:18:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761013119; cv=none; b=udzL/9QBvWDVtz1Tem29ka2GaltdkvGKAuj+nHyCHq8gyteyu7JiORIqhG8Imuxj2AOww+fwfqLTuZZR7vdVmC3rLP+z+mWhHqszY01boJxZVXuyYEiz6eCVRGMCS1SVmZK36EPpqSsT9cDG6N1CcpmW8A0k8YCghQbLl7jD6m8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761013119; c=relaxed/simple;
	bh=5hmayQpWFEnlj9lk15TbX3e+RKDmLihg12bokDKp9ZI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WQdZAuTeJQcJz6jthTuSDy3zxW151wskGHE2VBN/efswxkEvntM428iSVmHjbjw8DJGa+yhOMRIugjLvyFNhWHEmC3D068yzDnmVFWgKSmgZGdsvpWwuqQau7CUjSHnVqWdvXMgjwwHhre4ldKiaprrOs7Xj/TpQX20PJ3LBKjk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Pbm/pwjf; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2908C4CEFB;
	Tue, 21 Oct 2025 02:18:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761013118;
	bh=5hmayQpWFEnlj9lk15TbX3e+RKDmLihg12bokDKp9ZI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Pbm/pwjftMIp/AwO4wvL4bYMwnvwdXZiWczqSa3upKmlJZ6/uXV0+HrI3U5lILK2J
	 fg82t6Qb7Sn0htJIqHVw8z3SPxsHqZEiLuo+YzhtT9dVPW+uV+4Y1iuUcgZw1WrlwA
	 YemqlRHFcbXAU8jv0/Pe0vZrprw9drHIBYxK3ToPC8X+BZHuCSRPaDGqoGTQZJEiQC
	 kENCOpUNYtNbyZ5O3Acu/u2La9pX9uSKE96aCBnwhn+aDb0vmL0Huy9FVA4lof1fN8
	 9MAqrG4R1amC8DhJg0hWEFkwzlysOy+qibWYmjMyLbVabNJgTvchfsy9ucRtKNzuNv
	 QMLi2umTaU0tA==
Date: Tue, 21 Oct 2025 07:48:29 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: "Rob Herring (Arm)" <robh@kernel.org>, 
	Andreas =?utf-8?Q?F=C3=A4rber?= <afaerber@suse.de>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	linux-actions@lists.infradead.org, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: pinctrl: Convert actions,s700-pinctrl to DT
 schema
Message-ID: <3br66j7ghxg3yegzrlc4fpvfv5ttkjrlqtc624mmnuixre5pnn@gsnugcnk3c3l>
References: <20251013191207.4135075-1-robh@kernel.org>
 <CACRpkdZDM8zMtuPQ6rQQ+TZhz4bAYOepeETVQ34_MfDYx0LMmA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACRpkdZDM8zMtuPQ6rQQ+TZhz4bAYOepeETVQ34_MfDYx0LMmA@mail.gmail.com>

On Mon, Oct 20, 2025 at 10:55:58PM +0200, Linus Walleij wrote:
> On Mon, Oct 13, 2025 at 9:12 PM Rob Herring (Arm) <robh@kernel.org> wrote:
> 
> > Convert the actions,s700-pinctrl binding to DT schema format. It's a
> > straight-forward conversion.
> >
> > Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> 
> No comments for a week so patch applied.
> 

FWIW,

Acked-by: Manivannan Sadhasivam <mani@kernel.org>

- Mani

-- 
மணிவண்ணன் சதாசிவம்

