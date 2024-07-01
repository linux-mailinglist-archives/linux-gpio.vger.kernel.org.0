Return-Path: <linux-gpio+bounces-7858-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E5A6991E006
	for <lists+linux-gpio@lfdr.de>; Mon,  1 Jul 2024 14:59:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A06B1282950
	for <lists+linux-gpio@lfdr.de>; Mon,  1 Jul 2024 12:59:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D7BA15A85A;
	Mon,  1 Jul 2024 12:59:12 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com [185.176.79.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF173145B09;
	Mon,  1 Jul 2024 12:59:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.176.79.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719838752; cv=none; b=toyhfKWePGuMHCXmqMgA4Xj9aDRyPTrwSetv3vZ0aUzQc+m69g0Hj+qR3qLeuXvjQG5gXI3loIrae4LFW3YS+I7roF/w05xFEF1aaAO8pm18As9hZK/9N+EhtCE2NKUM/u6aTcf84Vm6rXiRsoefZNYg9K0rxRHaHMQXkCxJKxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719838752; c=relaxed/simple;
	bh=y59UMZbgXJ04k8ApN5nC2CDfx9hGm/eIr1ML8dMzHx4=;
	h=Date:From:To:CC:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=i5UTpWWlcPH0xUbfH7gZuyIZLbSPnTMDlCkQve8y12+cCRhGPNY6E8JM+cJB8IJ9ikbrTLD9U5LekeKneZUREpXC5OAv7IRXrYhaCE0JSQ+lFubOTU0YprsrjU7p3ZWyqUMTH+F5XHMSbqD15AWA8T7ytd0lSqMKA3STcq4danY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=Huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=185.176.79.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=Huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.31])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4WCR0z1RnHz6K6yM;
	Mon,  1 Jul 2024 20:58:11 +0800 (CST)
Received: from lhrpeml500005.china.huawei.com (unknown [7.191.163.240])
	by mail.maildlp.com (Postfix) with ESMTPS id 8BA72140682;
	Mon,  1 Jul 2024 20:59:08 +0800 (CST)
Received: from localhost (10.203.174.77) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Mon, 1 Jul
 2024 13:59:08 +0100
Date: Mon, 1 Jul 2024 13:59:07 +0100
From: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
CC: <linus.walleij@linaro.org>, <dan.carpenter@linaro.org>,
	<linux-gpio@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <aisheng.dong@nxp.com>, <festevam@gmail.com>,
	<shawnguo@kernel.org>, <kernel@pengutronix.de>,
	<u.kleine-koenig@pengutronix.de>, Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH V3 3/3] pinctrl: freescale: Use scope based
 of_node_put() cleanups
Message-ID: <20240701135907.00000e0b@Huawei.com>
In-Reply-To: <20240627131721.678727-4-peng.fan@oss.nxp.com>
References: <20240627131721.678727-1-peng.fan@oss.nxp.com>
	<20240627131721.678727-4-peng.fan@oss.nxp.com>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-w64-mingw32)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: lhrpeml500006.china.huawei.com (7.191.161.198) To
 lhrpeml500005.china.huawei.com (7.191.163.240)

On Thu, 27 Jun 2024 21:17:21 +0800
"Peng Fan (OSS)" <peng.fan@oss.nxp.com> wrote:

> From: Peng Fan <peng.fan@nxp.com>
> 
> Use scope based of_node_put() cleanup to simplify code.
> 
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
dev_err_probe() might apply in here - I haven't chased through
the callers.  Other than that lgtm

Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>


