Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0D3D7113E6A
	for <lists+linux-gpio@lfdr.de>; Thu,  5 Dec 2019 10:44:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729220AbfLEJoP (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 5 Dec 2019 04:44:15 -0500
Received: from mail-pg1-f194.google.com ([209.85.215.194]:43354 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728629AbfLEJoP (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 5 Dec 2019 04:44:15 -0500
Received: by mail-pg1-f194.google.com with SMTP id b1so1343724pgq.10;
        Thu, 05 Dec 2019 01:44:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=9OXPTK5is5MAu6gqHzjsjbFJrCMmWMBynlP4DOHl6vU=;
        b=iwfMIb35uILdAWSDOlh+FyQ9tnSvu7txLKyPWF9MdnATNPN8rEwnCJUWZHkNhf/8PG
         ih66Da9I2SGXDBs0IOYTNMPCtv8e8BWC+b0VnrjgpbgMUScodXCFbCUF9FBzyGSiBXJe
         uLZMYhWqavqWhMwnvqlypgUhy50EoSpamOfM+54nCmRezAfehKH+RTnhwtNVskdSFwMl
         2OPjNnIwpZTOBKj6G24T7OvUz4SGRD8UFWkUXIMbtmHnQw2qSCQObnqvXufjQhZ5mSg6
         iGg7icyR9WjcSdEWOQPhc0GLcoJM8G2+i/SNYQFKIw5JZmCH9WdGSkUnkI533NW9RS6o
         URhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=9OXPTK5is5MAu6gqHzjsjbFJrCMmWMBynlP4DOHl6vU=;
        b=X3TlfvwF5TtGHSLYemPmm7hBtd9LD+cgHR3mvP5Bq+pZg8vKoMgHx6rL/VnZow3rce
         BnJLcg3JD8NeR7HgtJsHbw/Y5SaD0osdHs9Ef/JknMsYmVt7mNnHGseU9CPTleJV8jTc
         edFIXaRyAZCMQ+B7aTuWG7v/UnjZcv2bOD64TpL5gPq4/8yCfxSNkl0fm12v04hMbfHV
         X25Ipfz884y/U+R73Xdxh3MWnihOHN7Hj8BsxqAJaPWkHpAHmMJdcKR6JaVLdEZxLZIT
         1vf93OSLCm+7KVQhquMBeXF8ko+a+PI+PD8EN6mMJ+Wc7S6v1sJXzx8QCceT8mA9EOTi
         TLXg==
X-Gm-Message-State: APjAAAVGt9FOrr/oKxyu6yKG/1j8NNBOifC22MGEHGrVRx2a/1fX7wfE
        nBemjx8Lkn5nCI5i/6ju/HA=
X-Google-Smtp-Source: APXvYqzW7QgkFu2dJ/HZnxmXq8ngSZ8SFnw+a5mHto3yCNJac/Nj7oOBjZreuETJwpzpM5r9yVK2Pg==
X-Received: by 2002:a63:a511:: with SMTP id n17mr8243308pgf.338.1575539053999;
        Thu, 05 Dec 2019 01:44:13 -0800 (PST)
Received: from sol (220-235-109-115.dyn.iinet.net.au. [220.235.109.115])
        by smtp.gmail.com with ESMTPSA id k23sm7004278pgg.7.2019.12.05.01.44.11
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 05 Dec 2019 01:44:13 -0800 (PST)
Date:   Thu, 5 Dec 2019 17:44:08 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: Re: [PATCH v2 11/11] tools: gpio: implement gpio-watch
Message-ID: <20191205094408.GA9303@sol>
References: <20191204155941.17814-1-brgl@bgdev.pl>
 <20191204155941.17814-2-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191204155941.17814-2-brgl@bgdev.pl>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Dec 04, 2019 at 04:59:41PM +0100, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> 
> Add a simple program that allows to test the new LINECHANGED_FD ioctl().
> 

A minor nit - the ioctl has since been changed to LINEINFO_WATCH.

Do you have anything else to test the ioctls?
Either way, I'll try to find some time to add some to my gpiod library.

Kent.

> Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> ---
>  tools/gpio/.gitignore   |   1 +
>  tools/gpio/Build        |   1 +
>  tools/gpio/Makefile     |  11 +++-
>  tools/gpio/gpio-watch.c | 112 ++++++++++++++++++++++++++++++++++++++++
>  4 files changed, 124 insertions(+), 1 deletion(-)
>  create mode 100644 tools/gpio/gpio-watch.c
> 
> diff --git a/tools/gpio/.gitignore b/tools/gpio/.gitignore
> index a94c0e83b209..fffd32969d62 100644
> --- a/tools/gpio/.gitignore
> +++ b/tools/gpio/.gitignore
> @@ -1,4 +1,5 @@
>  gpio-event-mon
>  gpio-hammer
>  lsgpio
> +gpio-watch
>  include/linux/gpio.h
> diff --git a/tools/gpio/Build b/tools/gpio/Build
> index 4141f35837db..67c7b7f6a717 100644
> --- a/tools/gpio/Build
> +++ b/tools/gpio/Build
> @@ -2,3 +2,4 @@ gpio-utils-y += gpio-utils.o
>  lsgpio-y += lsgpio.o gpio-utils.o
>  gpio-hammer-y += gpio-hammer.o gpio-utils.o
>  gpio-event-mon-y += gpio-event-mon.o gpio-utils.o
> +gpio-watch-y += gpio-watch.o
> diff --git a/tools/gpio/Makefile b/tools/gpio/Makefile
> index 6080de58861f..842287e42c83 100644
> --- a/tools/gpio/Makefile
> +++ b/tools/gpio/Makefile
> @@ -18,7 +18,7 @@ MAKEFLAGS += -r
>  
>  override CFLAGS += -O2 -Wall -g -D_GNU_SOURCE -I$(OUTPUT)include
>  
> -ALL_TARGETS := lsgpio gpio-hammer gpio-event-mon
> +ALL_TARGETS := lsgpio gpio-hammer gpio-event-mon gpio-watch
>  ALL_PROGRAMS := $(patsubst %,$(OUTPUT)%,$(ALL_TARGETS))
>  
>  all: $(ALL_PROGRAMS)
> @@ -66,6 +66,15 @@ $(GPIO_EVENT_MON_IN): prepare FORCE $(OUTPUT)gpio-utils-in.o
>  $(OUTPUT)gpio-event-mon: $(GPIO_EVENT_MON_IN)
>  	$(QUIET_LINK)$(CC) $(CFLAGS) $(LDFLAGS) $< -o $@
>  
> +#
> +# gpio-watch
> +#
> +GPIO_WATCH_IN := $(OUTPUT)gpio-watch-in.o
> +$(GPIO_WATCH_IN): prepare FORCE
> +	$(Q)$(MAKE) $(build)=gpio-watch
> +$(OUTPUT)gpio-watch: $(GPIO_WATCH_IN)
> +	$(QUIET_LINK)$(CC) $(CFLAGS) $(LDFLAGS) $< -o $@
> +
>  clean:
>  	rm -f $(ALL_PROGRAMS)
>  	rm -f $(OUTPUT)include/linux/gpio.h
> diff --git a/tools/gpio/gpio-watch.c b/tools/gpio/gpio-watch.c
> new file mode 100644
> index 000000000000..69aee43655ae
> --- /dev/null
> +++ b/tools/gpio/gpio-watch.c
> @@ -0,0 +1,112 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * gpio-watch - monitor unrequested lines for property changes using the
> + *              character device
> + *
> + * Copyright (C) 2019 BayLibre SAS
> + * Author: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> + */
> +
> +#include <ctype.h>
> +#include <errno.h>
> +#include <fcntl.h>
> +#include <linux/gpio.h>
> +#include <poll.h>
> +#include <stdbool.h>
> +#include <stdio.h>
> +#include <stdlib.h>
> +#include <string.h>
> +#include <sys/ioctl.h>
> +#include <unistd.h>
> +
> +static bool isnumber(const char *str)
> +{
> +	size_t sz = strlen(str);
> +	int i;
> +
> +	for (i = 0; i < sz; i++) {
> +		if (!isdigit(str[i]))
> +			return false;
> +	}
> +
> +	return true;
> +}
> +
> +int main(int argc, char **argv)
> +{
> +	struct gpioline_info_changed chg;
> +	struct gpioline_info req;
> +	struct pollfd pfd;
> +	int fd, i, j, ret;
> +	char *event;
> +	ssize_t rd;
> +
> +	if (argc < 3)
> +		goto err_usage;
> +
> +	fd = open(argv[1], O_RDWR | O_CLOEXEC);
> +	if (fd < 0) {
> +		perror("unable to open gpiochip");
> +		return EXIT_FAILURE;
> +	}
> +
> +	for (i = 0, j = 2; i < argc - 2; i++, j++) {
> +		if (!isnumber(argv[j]))
> +			goto err_usage;
> +
> +		memset(&req, 0, sizeof(req));
> +		req.line_offset = atoi(argv[j]);
> +
> +		ret = ioctl(fd, GPIO_GET_LINEINFO_WATCH_IOCTL, &req);
> +		if (ret) {
> +			perror("unable to set up line watch");
> +			return EXIT_FAILURE;
> +		}
> +	}
> +
> +	pfd.fd = fd;
> +	pfd.events = POLLIN | POLLPRI;
> +
> +	for (;;) {
> +		ret = poll(&pfd, 1, 5000);
> +		if (ret < 0) {
> +			perror("error polling the linechanged fd");
> +			return EXIT_FAILURE;
> +		} else if (ret > 0) {
> +			memset(&chg, 0, sizeof(chg));
> +			rd = read(pfd.fd, &chg, sizeof(chg));
> +			if (rd < 0 || rd != sizeof(chg)) {
> +				if (rd != sizeof(chg))
> +					errno = EIO;
> +
> +				perror("error reading line change event");
> +				return EXIT_FAILURE;
> +			}
> +
> +			switch (chg.event_type) {
> +			case GPIOLINE_CHANGED_REQUESTED:
> +				event = "requested";
> +				break;
> +			case GPIOLINE_CHANGED_RELEASED:
> +				event = "released";
> +				break;
> +			case GPIOLINE_CHANGED_CONFIG:
> +				event = "config changed";
> +				break;
> +			default:
> +				fprintf(stderr,
> +					"invalid event type received from the kernel\n");
> +				return EXIT_FAILURE;
> +			}
> +
> +			printf("line %u: %s at %llu\n",
> +			       chg.info.line_offset, event, chg.timestamp);
> +		}
> +	}
> +
> +	return 0;
> +
> +err_usage:
> +	printf("%s: <gpiochip> <line0> <line1> ...\n", argv[0]);
> +	return EXIT_FAILURE;
> +}
> -- 
> 2.23.0
> 
