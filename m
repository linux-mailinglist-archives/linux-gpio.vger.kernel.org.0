Return-Path: <linux-gpio+bounces-24227-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id ABC9AB21CF0
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Aug 2025 07:37:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DA5CF1907EEE
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Aug 2025 05:37:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C78E7285CB7;
	Tue, 12 Aug 2025 05:37:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="3HkKlvt5"
X-Original-To: linux-gpio@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51D6E311C38;
	Tue, 12 Aug 2025 05:37:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754977030; cv=none; b=QGNiUqA6CLUZW3JE02MXw9BhFUg3UX38U7uNsqCKdshk8fRF33Lzil8ZmYeH4Y/PjU6a3PxLFEmOAIWttI2b46T9EUJBvGL2n19/KSd2gLlWP04pqC+WY634zlsNYuiIeSB3zQ6knFSxQWJAgoUYImfXZKasemeitUf8XUVghX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754977030; c=relaxed/simple;
	bh=MxuZUfLG9JIAD56BOqH+aVu2VUQlQn0XGV9Z1NU7M6M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZSLiyYMQMYdsJQ5aFz6dNZd/NZo1O6fOnIxuOheFqlpeJ/Wu23SDH+aP9/e02GpYyqsjSsrrr9K/W7bGUd2M0Hk4oxU2Me2thJid1VJETyA6WDlATr9GQuZz/+1ncETjNJIJzeN+F7l+6ZK363dZPJWORTbMTKGxz8xJuMpY/bI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=3HkKlvt5; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=4BoM6wHBoiXZIwG7qJhFVXMqbt88KZmsQbyKJrYgctA=; b=3HkKlvt5HPmBWoc61Smef2sR7S
	DUrUDEXbCVN8axR3JVfZcCzxSWjSe4JL5pbaoGPgPHfxqQNCUlLBxZpl7g+oQccdqbLrPchfAsdk9
	QhmODRx0wO7lOg4niP/gCfmsFQO2Qy4JJw6rWZqQDUAfPz56X+LJVQk10eKRoetf+i88LlFI1+Bqb
	7cBV0PVvePOO6mdtISY/Jk+ltVDbYlcQNavUmsUFJayK+sFsHP7MVgmtHEcQ7X3DgnA0EcPjAo7cV
	hVnVZ2JycEk9kblLf+tL7EB+bjHzB7pPXaLDb6tMXQbKWBUnysYi55PreUBTt4yYltMBzJzzTr/qf
	iwpWWSUA==;
Received: from [50.53.25.54] (helo=[192.168.254.17])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulhh2-00000009tSq-3F4r;
	Tue, 12 Aug 2025 05:37:04 +0000
Message-ID: <b666c4ec-3aee-4917-86ed-bd65b5b7e051@infradead.org>
Date: Mon, 11 Aug 2025 22:37:04 -0700
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Documentation: gpio: add documentation about using
 software nodes
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Jonathan Corbet <corbet@lwn.net>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Arnd Bergmann <arnd@kernel.org>, Hans de Goede <hansg@kernel.org>,
 linux-gpio@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <b52lpk2vqr4asp5iaqwcvcac3b6gen52rbu4cwy5kcnxszc3fj@6i77jr53kzje>
 <5cd1c94c-e122-45e6-8333-9eff3ae6303e@infradead.org>
 <csgmuaw2ret5qamcuwyenhw3sgb7hbso5dei7lshrz4pdga2tp@5mbv4an3q5cu>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <csgmuaw2ret5qamcuwyenhw3sgb7hbso5dei7lshrz4pdga2tp@5mbv4an3q5cu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 8/11/25 10:17 PM, Dmitry Torokhov wrote:
> Hi Randy,
> 
> On Mon, Aug 11, 2025 at 05:46:02PM -0700, Randy Dunlap wrote:
>> Hi,
>>
>> On 8/11/25 2:30 PM, Dmitry Torokhov wrote:
>>> Introduce documentation regarding use of software nodes to describe
>>> GPIOs on legacy boards that have not been converted to device tree.
>>>
>>
>> Thanks for the additional documentation.
> 
> Thanks for the review.
> 
>>
>>> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
>>> ---
>>>  Documentation/driver-api/gpio/board.rst       |  64 ++++
>>>  Documentation/driver-api/gpio/index.rst       |   1 +
>>>  .../driver-api/gpio/legacy-boards.rst         | 298 ++++++++++++++++++
>>>  3 files changed, 363 insertions(+)
>>>
>>> diff --git a/Documentation/driver-api/gpio/board.rst b/Documentation/driver-api/gpio/board.rst
>>> index 4fd1cbd8296e..0cf64e1f2623 100644
>>> --- a/Documentation/driver-api/gpio/board.rst
>>> +++ b/Documentation/driver-api/gpio/board.rst
>>> @@ -94,6 +94,70 @@ with the help of _DSD (Device Specific Data), introduced in ACPI 5.1::
>>>  For more information about the ACPI GPIO bindings see
>>>  Documentation/firmware-guide/acpi/gpio-properties.rst.
>>>  
>>> +Software Nodes
>>> +--------------
>>> +Software nodes allows to construct an in-memory, device-tree-like structure
>>
>>                   allow { drivers | modules | software | us}
>>
>> although "software" seems redundant.
> 
> I changed it to "... allows board specific code ..."
> 
>>
>>> +using ``struct software_node`` and ``struct property_entry``. This structure
>>
>> Quoting Jon (for a different struct):
>>   Better to just say "struct list_head", and the automarkup logic should
>>   take care of the rest.
>>
>> @Jon: ISTM that we need something in Documentation/doc-guide/sphinx.rst (?) about which
>> keywords are handled by automarkup logic. AFAIK, they are struct, union, enum,
>> and typedef (keywords) and function() as indicated by the "()".
> 
> Unfortunately device properties/software nodes are not yet hooked to the
> documentations, so automatic markup/cross referencing does not work.
> 
> I changed this to :c:type:`struct software_node <software_node>`.

Oh no, that's worse from a human readability standpoint. :(

We try (would like to) keep .rst files as readable as .txt files.
All of that extra markup and notation is noisy and usually not needed.
Are you saying that the extra markup (as you listed above) is needed?
for cross-referencing?

The original would be better.

(same in the other .rst file)

-- 
~Randy


