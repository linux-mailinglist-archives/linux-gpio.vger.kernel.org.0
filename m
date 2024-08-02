Return-Path: <linux-gpio+bounces-8550-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BA328946390
	for <lists+linux-gpio@lfdr.de>; Fri,  2 Aug 2024 21:08:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E9A1E1C20DD1
	for <lists+linux-gpio@lfdr.de>; Fri,  2 Aug 2024 19:08:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 107951537CE;
	Fri,  2 Aug 2024 19:08:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b="I6eB5LGO"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D7E71E522;
	Fri,  2 Aug 2024 19:08:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722625711; cv=none; b=a2jnu90pb99v8EGvJZ/CfhfyKQDcdPMNqduG6hnNn9WsS0bbdwcjFV95p4dN3MnrVMX33oeBFnKeSUNr3tXlKQPVFzDQQ5Ss1/oCsR2hj5g0NZpb//24ZIqYxgPtFQTFocbMWiEZoPVYuG2Sa9tfTKVABFXLUjpveq1pGD8Qddo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722625711; c=relaxed/simple;
	bh=8DT2/RGGxHgNOPt6LQclvhXki/U7OdhBNvWPDeFNvWw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lY3YfdXbXkfK4wGiEgrfrrtu+Vm8fykBqE5ui+iM8wp8tjO+vJC35YKWrSN21htIpWw0xZ/iXfzguBm8kFCNxLEn8rkJtDBH5TiM/BLG5znnxqGnwZ+OavNZMeDUPnSNz92K1Ef4T7p8QSYxEDP7h9N6cnxPgNf/Il/LW3ayJ3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net; spf=pass smtp.mailfrom=gmx.net; dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b=I6eB5LGO; arc=none smtp.client-ip=212.227.17.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1722625697; x=1723230497; i=wahrenst@gmx.net;
	bh=8DT2/RGGxHgNOPt6LQclvhXki/U7OdhBNvWPDeFNvWw=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=I6eB5LGO6KqTrFLe2RlLQK2mKRhNJGh7eEK6/wwz6093k+wBqk3VS4rxjYcD3aiD
	 o3y9jUvwgXLmveYzNsWB+GHT/8UlPYLbVAqkqY0oUQLsfalzBks2WDrGFvK77bEWV
	 /T330CK6TgR6t0jXSvdiaB2sWe9QjOsy+Oc0mjQ/T5UMm5axxAPGc4626EjwGXOjG
	 QOxRnIw9Qz2AegIUAsx+j0+qcc0SzQgLqW2cl1DjVPUtdkW/PSksMFEGITVbrxS+m
	 7YKsH9gp8fs/rdc2gymR2lOMluwBOaQezjA+TulLj9q4HIBIezTX/Bx10ybw9K8G7
	 RJzt5JCBC7ebj2lpRg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.1.127] ([37.4.248.43]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1M4b1y-1sZP8h2mHu-00AJPB; Fri, 02
 Aug 2024 21:08:17 +0200
Message-ID: <12fd21d4-8061-41d0-b60f-d02102eca1c6@gmx.net>
Date: Fri, 2 Aug 2024 21:08:16 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/7] arm64: dts: broadcom: bcm2712: Add one more GPIO node
To: "Ivan T. Ivanov" <iivanov@suse.de>, linus.walleij@linaro.org,
 robh@kernel.org, krzk+dt@kernel.org
Cc: conor+dt@kernel.org, florian.fainelli@broadcom.com,
 andrea.porta@suse.com, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20240731062814.215833-1-iivanov@suse.de>
 <20240731062814.215833-6-iivanov@suse.de>
Content-Language: en-US
From: Stefan Wahren <wahrenst@gmx.net>
In-Reply-To: <20240731062814.215833-6-iivanov@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:OQkBER6mRoJDwGaq2T/zYHKS/N3xNtrfEwnHKoBQKSNAKzdeHag
 OgnYqDeLlBFFAkdFeROP3QZvzFhBRhL82BglL+Nixo5vzRs1rDsZrJM7rY/m7ysH3SaSoD0
 wBdI20g2QgX9q7csRZDa8Uv4rcp1J4u7yNUT6rr0+bZmhdlzB2khRaVC0j/mCNrM9wHIbmb
 pTTkV1NyuxfSEbK9QpWqA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:kljvYX5yLn0=;BAtumo1UWcB4Nkae3fDrWlCRG5F
 4WZHywdjo3+quWpeR6cEjJKxmntOqBHrKvErAZzQiJpYluCw0DLRiZ+6sYfyoJZ5FfGEThOlc
 o3TfMx5uc4lnDuJFCi4Bj3M2x17otAVxdpSMnrGujNJ8gU3VYyb+J5YiPoJa35RW7K+dJGxb+
 R7SraEKUYjL0E3yAInjWrtUrziJls/rBRmBRZmQG/QgN6b1eIEW6Kbc1Vk8bzVd/Hczjx8/O5
 vcZ1toc8X5J/HOWpRIGhOGF2V2bSmWbuTsJb4NTzJGZT0Vx8wlJtG+KzZeA73JPDA6marlJTy
 x9lUbB4ooc7bJgSpjc9vilcH7VhQMlsbKbnih4yo7bC2eWibBDp43JP0+4juijdnW4c6VXYCN
 2fJ+tcbNTOVHizmF6WgqgmUxtJ7f1uX3bHO0vadIFpbsCIr5JSIEhN6mCUkycwIJUIPMjEQv+
 DdX+Y1BrmDqLgoEIC/4czx7T/9FjQlJeJIKjNTzQqBJBd0CeyE3pbr+SKE21YmzMsjl6fA+Qk
 5jK6iRm3DBWIT3dgoP7CCmYvb+atXfytEqVfX+Gc1r+3xwDwXG9tfvr9KhRN8OeezRA7k3Lm6
 Hm9mxwJQ4PWiZXc8F0JYewxL9uHB5PJtxLOiIP55+S5qfhyUJrWHZL1OQy0WqUIdJ14dSlhWi
 Q0Z25bDU2redWrlJIjhR9qJzlg13xCFKazcLy1vP82d6gsqqn24iHq9MCOJrIJmjmagCFihbZ
 kdCcTlg65HSFOioEYEabIMbE6bDJUqXd1z7/xW9tOF5KYhaKUC9RK+AGO9b6PoHnah1WTwuYt
 CumJbKKriZ6TRmygyb+Z+1Og==

Hi Ivan,

Am 31.07.24 um 08:28 schrieb Ivan T. Ivanov:
> Add GPIO and related interrupt controller nodes and wire one
> of the lines to power button.
>
Since we enable the GPIO controller here, i think we should provide the
relevant gpio-line-names for the Raspberry Pi 5 board. So gpioinfo works
from the beginning. Doesn't need to be in this patch directly.

Thanks

