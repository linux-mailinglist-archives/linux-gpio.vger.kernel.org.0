Return-Path: <linux-gpio+bounces-10407-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 546F0984C15
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Sep 2024 22:19:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1576F284E3E
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Sep 2024 20:19:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46DDE13A3FF;
	Tue, 24 Sep 2024 20:19:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="lXvUst0J"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08EA0335C7
	for <linux-gpio@vger.kernel.org>; Tue, 24 Sep 2024 20:19:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727209153; cv=none; b=j9CpLTHPfSMOhObaBtiGZnKhR/T2Q27FlioFV44QkN0RFKhmxDbMRhTvu0SuN3470p7UgZ1CcRDvk7EdoHE5dJdW1SVl0bppU23GyNLF+/SHm/QxEUBWJEK3duW++ACCGn5vEdFqMOwYvKg/VvpqpheyfPQvQvtkpdv4hswIUZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727209153; c=relaxed/simple;
	bh=/P8Ykx2x6Tqmd2pibof/e5oJDnIoiUFdewa0tCtEKYU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZIYX1QTxT7kEC6WI0yqtZX+q3FJhucDAHZC0EpUDQ0cQjzMee7Vupc6orZqtF59jxJVYz/kZrJLXYrs+7VlpkFrbfGh0GdVaJl1dqvTBtKv8AIMrzKnNhfXxc0G8T+9U9cp15QMUkOEtA4nRV/7lzIvfR9snsG2hlypLIU2jaiM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=lXvUst0J; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7CD2AC4CEC4;
	Tue, 24 Sep 2024 20:19:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1727209152;
	bh=/P8Ykx2x6Tqmd2pibof/e5oJDnIoiUFdewa0tCtEKYU=;
	h=Date:From:To:Cc:Subject:From;
	b=lXvUst0J79r/vZtEBz2vHy+JQ90eSnEqtIzesa43CS3Rj4JAt4AZvfLGGlay3ACC5
	 yYd/xbGjRDOB6mwSnCJIOr4mV3JnrG5ThcDbvJ1boqiVqY9GARb9cSoE8rQOrriYa7
	 r79npkIPofHPBm6VYjSyok5cXR64PRbSduBcrUIg=
Date: Tue, 24 Sep 2024 16:19:11 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Emil Renner Berthing <kernel@esmil.dk>, 
	Hal Feng <hal.feng@starfivetech.com>
Cc: linux-gpio@vger.kernel.org, helpdesk@kernel.org
Subject: Bouncing maintainer: Jianlong Huang
Message-ID: <20240924-discerning-benign-labradoodle-a9b7d8@lemur>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hello:

I'm reaching out to co-maintainers of the following subsystems:

  - STARFIVE JH71X0 PINCTRL DRIVERS

The email address for one of your maintainers is bouncing:

  M: Jianlong Huang <jianlong.huang@starfivetech.com>

There are several possible courses of action:

1. If you know the new email address for the maintainer, please ask them to
   submit a patch for MAINTAINERS and .mailmap files.

2. If this maintainer stepped away from their duties, or if co-maintainers are
   equally unable to reach them via any other means, please submit a patch to
   MAINTAINERS to remove their M: entry.

The goal is to have no bouncing M: entries in the maintainers file, so please
follow up as soon as you have decided on the correct course of action.

Best regards,
--
Konstantin Ryabitsev
Linux Foundation

bugspray track

