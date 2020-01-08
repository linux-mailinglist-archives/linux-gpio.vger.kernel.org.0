Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 54C5413421F
	for <lists+linux-gpio@lfdr.de>; Wed,  8 Jan 2020 13:47:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727666AbgAHMrb (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 8 Jan 2020 07:47:31 -0500
Received: from mga09.intel.com ([134.134.136.24]:4496 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727263AbgAHMrb (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 8 Jan 2020 07:47:31 -0500
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 08 Jan 2020 04:47:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,410,1571727600"; 
   d="scan'208";a="370935594"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga004.jf.intel.com with ESMTP; 08 Jan 2020 04:47:28 -0800
Received: from andy by smile with local (Exim 4.93)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1ipAkD-0002xU-G0; Wed, 08 Jan 2020 14:47:29 +0200
Date:   Wed, 8 Jan 2020 14:47:29 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: Re: [PATCH v4 13/13] tools: gpio: implement gpio-watch
Message-ID: <20200108124729.GS32742@smile.fi.intel.com>
References: <20191224120709.18247-1-brgl@bgdev.pl>
 <20191224120709.18247-14-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191224120709.18247-14-brgl@bgdev.pl>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Dec 24, 2019 at 01:07:09PM +0100, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> 
> Add a simple program that allows to test the new LINECHANGED_FD ioctl().

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

> 
> Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> ---
>  tools/gpio/.gitignore   |  1 +
>  tools/gpio/Build        |  1 +
>  tools/gpio/Makefile     | 11 ++++-
>  tools/gpio/gpio-watch.c | 99 +++++++++++++++++++++++++++++++++++++++++
>  4 files changed, 111 insertions(+), 1 deletion(-)
>  create mode 100644 tools/gpio/gpio-watch.c
> 
> diff --git a/tools/gpio/.gitignore b/tools/gpio/.gitignore
> index a94c0e83b209..eab36c6d7751 100644
> --- a/tools/gpio/.gitignore
> +++ b/tools/gpio/.gitignore
> @@ -1,4 +1,5 @@
>  gpio-event-mon
>  gpio-hammer
> +gpio-watch
>  lsgpio
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
> index 000000000000..5cea24fddfa7
> --- /dev/null
> +++ b/tools/gpio/gpio-watch.c
> @@ -0,0 +1,99 @@
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
> +int main(int argc, char **argv)
> +{
> +	struct gpioline_info_changed chg;
> +	struct gpioline_info req;
> +	struct pollfd pfd;
> +	int fd, i, j, ret;
> +	char *event, *end;
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
> +		memset(&req, 0, sizeof(req));
> +
> +		req.line_offset = strtoul(argv[j], &end, 0);
> +		if (*end != '\0')
> +			goto err_usage;
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

-- 
With Best Regards,
Andy Shevchenko


